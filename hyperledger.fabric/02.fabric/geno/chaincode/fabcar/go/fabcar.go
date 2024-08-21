/*
SPDX-License-Identifier: Apache-2.0
*/

package main

import (
	"encoding/json"
	"fmt"
	"strconv"

	"github.com/hyperledger/fabric-contract-api-go/contractapi"
)

// SmartContract provides functions for managing a car
type SmartContract struct {
	contractapi.Contract
}

// Car describes basic details of what makes up a car
type Gene struct {
	UserNo						string `json:"userNo"`
	UserId						string `json:"userId"`
	UserAge						string `json:"userAge"`
	GenomeRequestDate			string `json:"genomeRequestDate"`
	GenomeType					string `json:"genomeType"`
	IsGenomeApproved			string `json:"isGenomeApproved"`
	AnalysisMethod				string `json:"analysisMethod"`
	AnalysisOrganization		string `json:"analysisOrganization"`
	AnalysisStatus				string `json:"analysisStatus"`
	LastUpdatedDate				string `json:"lastUpdatedDate"`
	UserMessage					string `json:"userMessage"`
	AdditionalInfo				string `json:"additionalInfo"`
	AppVersion					string `json:"appVersion"`
}

// QueryResult structure used for handling result of query
type QueryResult struct {
	Key    string `json:"Key"`
	Record *Gene
}

// InitLedger adds a base set of cars to the ledger
func (s *SmartContract) InitLedger(ctx contractapi.TransactionContextInterface) error {
	genes := []Gene{
		Gene{
			UserNo: "1d1331633c99d4dbce6c99fbd5b9bcb5cb090bfa7bd674dfb4d1b44f990387c8", 
			UserId: "teamj", 
			UserAge: "27", 
			GenomeRequestDate: "2023-08-01 12:55:39", 
			GenomeType: "WGS", 
			IsGenomeApproved: "false", 
			AnalysisMethod: "WGS", 
			AnalysisOrganization: "GenomeLab Inc.",
			AnalysisStatus: "waiting", 
			LastUpdatedDate: "2023-08-01 12:55:39", 
			UserMessage: "none", 
			AdditionalInfo: "none", 
			AppVersion: "1.0", 
		},
	}

	for i, gene := range genes {
		geneAsBytes, _ := json.Marshal(gene)
		err := ctx.GetStub().PutState("GENE"+strconv.Itoa(i), geneAsBytes)

		if err != nil {
			return fmt.Errorf("Failed to put to world state. %s", err.Error())
		}
	}

	return nil
}

// CreateCar adds a new car to the world state with given details
func (s *SmartContract) CreateGene(ctx contractapi.TransactionContextInterface, userNo string, userId string, userAge string, 
	genomeRequestDate string, genomeType string, isGenomeApproved string, analysisMethod string, 
	analysisOrganization string, analysisStatus string, lastUpdatedDate string, userMessage string, additionalInfo string, appVersion string) error {
	gene := Gene{
		UserNo: userNo,
		UserId: userId,
		UserAge: userAge,
		GenomeRequestDate: genomeRequestDate,
		GenomeType: genomeType,
		IsGenomeApproved: isGenomeApproved,
		AnalysisMethod: analysisMethod,
		AnalysisOrganization: analysisOrganization,
		AnalysisStatus: analysisStatus,
		LastUpdatedDate: lastUpdatedDate,
		UserMessage: userMessage,
		AdditionalInfo: additionalInfo,
		AppVersion: appVersion,
	}

	geneAsBytes, _ := json.Marshal(gene)

	return ctx.GetStub().PutState(userNo, geneAsBytes)
}

// QueryCar returns the car stored in the world state with given id
func (s *SmartContract) QueryGene(ctx contractapi.TransactionContextInterface, userNo string) (*Gene, error) {
	geneAsBytes, err := ctx.GetStub().GetState(userNo)

	if err != nil {
		return nil, fmt.Errorf("Failed to read from world state. %s", err.Error())
	}

	if geneAsBytes == nil {
		return nil, fmt.Errorf("%s does not exist", userNo)
	}

	gene := new(Gene)
	_ = json.Unmarshal(geneAsBytes, gene)

	return gene, nil
}

// QueryAllCars returns all cars found in world state
func (s *SmartContract) QueryAllGene(ctx contractapi.TransactionContextInterface) ([]QueryResult, error) {
	startKey := ""
	endKey := ""

	resultsIterator, err := ctx.GetStub().GetStateByRange(startKey, endKey)

	if err != nil {
		return nil, err
	}
	defer resultsIterator.Close()

	results := []QueryResult{}

	for resultsIterator.HasNext() {
		queryResponse, err := resultsIterator.Next()

		if err != nil {
			return nil, err
		}

		gene := new(Gene)
		_ = json.Unmarshal(queryResponse.Value, gene)

		queryResult := QueryResult{Key: queryResponse.Key, Record: gene}
		results = append(results, queryResult)
	}

	return results, nil
}

// ChangeCarOwner updates the owner field of car with given id in world state
func (s *SmartContract) ChangeGene(ctx contractapi.TransactionContextInterface, userNo string, isGenomeApproved string, analysisStatus string, lastUpdatedDate string) error {
	gene, err := s.QueryGene(ctx, userNo)

	if err != nil {
		return err
	}

	gene.IsGenomeApproved = isGenomeApproved
	gene.AnalysisStatus = analysisStatus
	gene.LastUpdatedDate = lastUpdatedDate

	geneAsBytes, _ := json.Marshal(gene)

	return ctx.GetStub().PutState(userNo, geneAsBytes)
}

func main() {

	chaincode, err := contractapi.NewChaincode(new(SmartContract))

	if err != nil {
		fmt.Printf("Error create fabcar chaincode: %s", err.Error())
		return
	}

	if err := chaincode.Start(); err != nil {
		fmt.Printf("Error starting fabcar chaincode: %s", err.Error())
	}
}
