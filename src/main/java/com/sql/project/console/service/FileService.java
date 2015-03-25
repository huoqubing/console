package com.sql.project.console.service;

import java.io.File;

public interface FileService {
	public String[] upload(File file, String keyPath, String type, boolean compress);
}
