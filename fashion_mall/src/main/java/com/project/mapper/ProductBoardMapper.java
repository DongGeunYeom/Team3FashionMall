package com.project.mapper;

import com.project.dto.ProductBoardDTO;
import com.project.dto.ProductDTO;
import com.project.dto.ReviewDTO;

public interface ProductBoardMapper {
	
	public int register(ProductBoardDTO insertBoardDto);
	public int registerReview(ReviewDTO insertReviewDto);
	
}
