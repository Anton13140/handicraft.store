package com.handicraft.store.repositories;

import com.handicraft.store.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImagesRepository extends JpaRepository<Image, Long> {

}
