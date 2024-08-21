package org.team.j.geno.block.api.client;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.team.j.geno.block.constant.Constant;
import org.team.j.geno.block.model.GeneModel;
import org.team.j.geno.block.model.UserModel;
import org.team.j.geno.block.utils.Utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class HyperledgerFabricAPIClientTests {

	private HyperledgerFabricAPIClient client;

	public HyperledgerFabricAPIClientTests() {
		client = new HyperledgerFabricAPIClient();
	}

//	@Test
	public void enroll() {
		System.out.println(client);
		log.debug(client.enrollAdmin());
	}

//	@Test
	public void register() {

		UserModel user = new UserModel();
		user.setName("teamj");
		user.setAccount("teamj-account");
		user.setAffiliation(Constant.AFFILIATION);

		String res = client.registerUser(user);

		log.debug(res);
	}

	@Test
	public void genes() throws JSONException {
		
		String res = client.userGenes("teamj");
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		JSONArray jsonArray = new JSONArray(res);

        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            JSONObject recordObject = jsonObject.getJSONObject("Record");
            
            Type GeneModelType = new TypeToken<GeneModel>() {}.getType();
            
            GeneModel geneModels = gson.fromJson(recordObject.toString(), GeneModelType);
            
            System.out.println(gson.toJson(geneModels));
        }
		
	}

//	@Test
	public void insert() {

		String uid = Utils.getInstance().getNewUID();

		GeneModel geneModel = new GeneModel();
		geneModel.setUserNo(Utils.getInstance().getNewHash(uid));
		geneModel.setUserId("teamj");
		geneModel.setUserAge("27");
		geneModel.setGenomeRequestDate(Utils.getInstance().getCurruntTime());
		geneModel.setGenomeType("WGS");
		geneModel.setIsGenomeApproved("false");
		geneModel.setAnalysisMethod("주요 암 유전자 분석");
		geneModel.setAnalysisOrganization("GenomeLab Inc.");
		geneModel.setAnalysisStatus("대기");
		geneModel.setLastUpdatedDate(Utils.getInstance().getCurruntTime());
		geneModel.setUserMessage("none");
		geneModel.setAdditionalInfo("none");
		geneModel.setAppVersion("1.0");

		String res = client.insertGenes(geneModel);
		
		log.debug(res);
	}

//	@Test
	public void update() {
		String res = client.updateApproved("teamj", "056fdeeb1ea4a34e7058a595f900635b5f09a517b623376c6def98aab1c0cb05",
				"true",  "run", Utils.getInstance().getCurruntTime());
		log.debug(res);
	}

//	@Test
	public void select() {
		String res = client.selectGeneNo("teamj", "GENE0");
		log.debug(res);
	}
}
