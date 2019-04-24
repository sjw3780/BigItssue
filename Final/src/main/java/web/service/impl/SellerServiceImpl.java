package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.SellerDao;
import web.service.face.SellerService;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired SellerDao sellerDao;
	
}
