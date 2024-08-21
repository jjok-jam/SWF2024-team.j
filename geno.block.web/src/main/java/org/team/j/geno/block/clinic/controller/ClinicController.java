package org.team.j.geno.block.clinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.j.geno.block.api.client.HyperledgerFabricAPIClient;
import org.team.j.geno.block.model.GeneModel;
import org.team.j.geno.block.utils.Utils;

import lombok.extern.slf4j.Slf4j;

/**
 * @author wangho
 *
 */
@Slf4j
@RequestMapping(value = "clinic")
@Controller
public class ClinicController {

	@Autowired
	private HyperledgerFabricAPIClient client;

	/**
	 * @Author : wangho
	 * @Date : 2023. 8. 1.
	 * @Description :
	 * @ModifiedHistory :
	 */
	@RequestMapping(value = "/")
	public String clinic() {

		return "clinic/clinic";
	}

	/**
	 * @Author : wangho
	 * @Date : 2023. 8. 1.
	 * @Description :
	 * @ModifiedHistory :
	 */
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register() {

		String uid = Utils.getInstance().getNewUID();
		
		GeneModel geneModel = new GeneModel();
		geneModel.setUserId("teamj");
		geneModel.setUserNo(Utils.getInstance().getNewHash(uid));
		geneModel.setUserAge("27");
		geneModel.setGenomeRequestDate(Utils.getInstance().getCurruntTime());
		geneModel.setGenomeType("WGS");
		geneModel.setIsGenomeApproved("false");
		geneModel.setAnalysisMethod("Whole Genome Sequencing");
		geneModel.setAnalysisOrganization("GenomeLab Inc.");
		geneModel.setAnalysisStatus("대기");
		geneModel.setLastUpdatedDate(Utils.getInstance().getCurruntTime());
		geneModel.setUserMessage("none");
		geneModel.setAdditionalInfo("none");
		geneModel.setAppVersion("1.0");

		String res = client.insertGenes(geneModel);

		log.debug("res: {}", res);

		return res;
	}
}
