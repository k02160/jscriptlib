var FileFind = function()
{
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	
	this.fso = fso;
	this.files = new Array();
}

FileFind.prototype.getFiles = function(folderpath)
{
	var fso = this.fso;
	var folder = fso.GetFolder(folderpath);
	var path;
	
	// ファイルを検索
	var files = new Enumerator(folder.Files);
	for(; !files.atEnd(); files.moveNext()){
		path = files.item();
		this.files.push(path);
	}
	
	// サブフォルダを検索
	var subfolders = new Enumerator(folder.SubFolders);
	for(; !subfolders.atEnd(); subfolders.moveNext()){
		this.getFiles(subfolders.item());
	}
	
	return this.files;
}
