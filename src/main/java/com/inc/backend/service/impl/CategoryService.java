package com.inc.backend.service.impl;

import com.inc.backend.domain.Category;
import com.inc.backend.exception.ApplicationException;
import com.inc.backend.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class CategoryService {

    @Autowired
    private final CategoryRepository categoryRepository;

    private Category getCategoryByName(String cateogoryName) throws ApplicationException{
         var cat = categoryRepository.findCategoryByTitle(cateogoryName);

            if(cat.isEmpty())
                throw ApplicationException.builder()
                        .title("category not found")
                        .status(404)
                        .Description("please choose proper category")
                        .build();

         return  cat.get();
    }
}
