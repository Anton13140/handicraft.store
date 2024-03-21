package com.handicraft.store.services;
import java.security.*;
import com.handicraft.store.models.Image;
import com.handicraft.store.models.Product;
import com.handicraft.store.models.User;
import com.handicraft.store.repositories.ProductRepository;
import com.handicraft.store.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public List<Product> listProducts(String name) {
        if (name != null) return productRepository.findByName(name);
        return productRepository.findAll();
    }
    public void saveProduct(Principal principal,  Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3 ) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if(file1.getSize() != 0){
            image1 = toImagesEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if(file2.getSize() != 0){
            image2 = toImagesEntity(file2);
            product.addImageToProduct(image2);
        }
        if(file3.getSize() != 0){
            image3 = toImagesEntity(file3);
            product.addImageToProduct(image3);
        }
        log.info("Saving new Product. Name: {}", product.getName());
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImagesId(productFromDb.getImages().get(0).getId());
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByEmail(principal.getName());

    }

    private Image toImagesEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(Long id){
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {

        return productRepository.findById(id).orElse(null);
    }
}
