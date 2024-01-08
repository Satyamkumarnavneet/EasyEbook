package com.EasyEbook.repos;

//EbookRepository.java
import org.springframework.data.jpa.repository.JpaRepository;

import com.EasyEbook.models.Books;

public interface BookRepo extends JpaRepository<Books, Integer> {
	
}
