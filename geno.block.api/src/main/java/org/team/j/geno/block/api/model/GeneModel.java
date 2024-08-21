package org.team.j.geno.block.api.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class GeneModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String userNo;
	private String userId;
	private String userAge;
	private String genomeRequestDate;
	private String genomeType;
	private String isGenomeApproved;
	private String analysisMethod;
	private String analysisOrganization;
	private String analysisStatus;
	private String lastUpdatedDate;
	private String userMessage;
	private String additionalInfo;
	private String appVersion;
}
