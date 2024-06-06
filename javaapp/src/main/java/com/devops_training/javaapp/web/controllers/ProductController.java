package com.devops_training.javaapp.web.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.devops_training.javaapp.services.IProductService;
import com.devops_training.javaapp.web.dtos.ProductDTO;
import com.devops_training.javaapp.web.mappers.IProductMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
public class ProductController {

    @Value("${spring.profiles.active}")
    private String value;

    private final IProductService productService;
    private final IProductMapper productMapper;

    @GetMapping("/v1/products")
    public ResponseEntity<List<ProductDTO>> getAllProducts() {
        log.info("[ENDPOINT] Received request to get all product " + value);

        final List<ProductDTO> productDTOList = productService.getAllProducts()
                .stream()
                .map(product -> productMapper.productToProductDTO(product))
                .collect(Collectors.toList());
        return ResponseEntity.ok(productDTOList);

    }

}
