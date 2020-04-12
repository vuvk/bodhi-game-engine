/*
 * PhysicsFS binding for Vala (Plain C Style)
 */

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="physfs.h")]
namespace PHYSFS
{
    [SimpleType]
    public struct File {
		void* opaque;  /**< That's all you get. Don't touch. */
	}
	/**
	 * \struct PHYSFS_ArchiveInfo
	 * \brief Information on various PhysicsFS-supported archives.
	 */
	public struct ArchiveInfo {
		public string? extension;   /**< Archive file extension: "ZIP", for example. */
		public string? description; /**< Human-readable archive description. */
		public string? author;      /**< Person who did support for this archive. */
		public string? url;         /**< URL related to this archive */
		public bool supports_symlinks;    /**< non-zero if archive offers symbolic links. */
	}

	/**
	 * \struct PHYSFS_Version
	 * \brief Information the version of PhysicsFS in use.
	 */
	public struct Version {
		public uint8 major; /**< major revision */
		public uint8 minor; /**< minor revision */
		public uint8 patch; /**< patchlevel */
	}
	/**
	 * \fn void PHYSFS_getLinkedVersion(PHYSFS_Version *ver)
	 * \brief Get the version of PhysicsFS that is linked against your program.
	 */
	[CCode (cname = "PHYSFS_getLinkedVersion")]
	public void get_linked_version(Version* ver);
	
	/**
	 * \fn int PHYSFS_init(const char *argv0)
	 * \brief Initialize the PhysicsFS library.
	 */
	[CCode (cname = "PHYSFS_init")]
	public bool init(string argv0);

	/**
	 * \fn int PHYSFS_deinit()
	 * \brief Deinitialize the PhysicsFS library.
	 */
	[CCode (cname = "PHYSFS_deinit")]
	public bool deinit();

	/**
	* \fn const PHYSFS_ArchiveInfo **PHYSFS_supportedArchiveTypes()
	* \brief Get a list of supported archive types.
	*/
	[CCode (cname = "PHYSFS_supportedArchiveTypes")]	
	public unowned ArchiveInfo*[]? supported_archive_types();

	/**
	* \fn void PHYSFS_freeList(void *listVar)
	* \brief Deallocate resources of lists returned by PhysicsFS.
	*/
	[CCode (cname = "PHYSFS_freeList")]
	public void free_list(void* list_var);

	/**
	* \fn const char *PHYSFS_getLastError()
	* \brief Get human-readable error information.
	*/
	[CCode (cname = "PHYSFS_getLastError")]
	public unowned string? get_last_error();

	/**
	* \fn const char *PHYSFS_getDirSeparator()
	* \brief Get platform-dependent dir separator string.
	*/
	[CCode (cname = "PHYSFS_getDirSeparator")]
	public unowned string? get_dir_separator();

	/**
	* \fn void PHYSFS_permitSymbolicLinks(int allow)
	* \brief Enable or disable following of symbolic links.
	*/
	[CCode (cname = "PHYSFS_permitSymbolicLinks")]
	public void permit_symbolic_links(int allow);

	/**
	* \fn char **PHYSFS_getCdRomDirs()
	* \brief Get an array of paths to available CD-ROM drives.
	*/
	[CCode (cname = "PHYSFS_getCdRomDirs")]
	public string?[] get_cdrom_dirs();

	/**
	* \fn const char *PHYSFS_getBaseDir()
	* \brief Get the path where the application resides.
	*/
	[CCode (cname = "PHYSFS_getBaseDir")]
	public unowned string? get_base_dir();


	/**
	* \fn const char *PHYSFS_getUserDir()
	* \brief Get the path where user's home directory resides.
	*/
	[CCode (cname = "PHYSFS_getUserDir")]
	public unowned string? get_user_dir();

	/**
	* \fn const char *PHYSFS_getWriteDir()
	* \brief Get path where PhysicsFS will allow file writing.
	*/
	[CCode (cname = "PHYSFS_getWriteDir")]
	public unowned string? get_write_dir();

	/**
	* \fn int PHYSFS_setWriteDir(const char *newDir)
	* \brief Tell PhysicsFS where it may write files.
	*/
	[CCode (cname = "PHYSFS_setWriteDir")]
	public bool set_write_dir(string new_dir);


	/**
	* \fn int PHYSFS_addToSearchPath(const char *newDir, int appendToPath)
	* \brief Add an archive or directory to the search path.
	*/
	[CCode (cname = "PHYSFS_addToSearchPath")]
	public bool add_to_search_path(string new_dir, bool append_to_path);

	/**
	* \fn int PHYSFS_removeFromSearchPath(const char *oldDir)
	* \brief Remove a directory or archive from the search path.
	*/
	[CCode (cname = "PHYSFS_removeFromSearchPath")]
	public bool remove_from_search_path(string old_dir);

	/**
	* \fn char **PHYSFS_getSearchPath()
	* \brief Get the current search path.
	*/
	[CCode (cname = "PHYSFS_getSearchPath")]
	public unowned string?[] PHYSFS_getSearchPath();

	/**
	* \fn int PHYSFS_setSaneConfig(const char *organization, const char *appName, const char *archiveExt, int includeCdRoms, int archivesFirst)
	* \brief Set up sane, default paths.
	*/
	[CCode (cname = "PHYSFS_setSaneConfig")]
	public bool set_sane_config(string organization,
							    string app_name,
							    string archive_ext,
							    bool include_cdroms,
							    bool archives_first);

	/* Directory management stuff ... */
	
	/**
	 * \fn int PHYSFS_mkdir(const char *dirName)
	 * \brief Create a directory.
	 */
	[CCode (cname = "PHYSFS_mkdir")]
	public bool mkdir(string dir_name);
	
	/**
	 * \fn int PHYSFS_delete(const char *filename)
	 * \brief Delete a file or directory.
	 */
	[CCode (cname = "PHYSFS_delete")]
	public bool delete(string filename);
	
	/**
	 * \fn const char *PHYSFS_getRealDir(const char *filename)
	 * \brief Figure out where in the search path a file resides.
	 */
	[CCode (cname = "PHYSFS_getRealDir")]
	public unowned string? get_real_dir(string filename);	
	
	/**
	 * \fn char **PHYSFS_enumerateFiles(const char *dir)
	 * \brief Get a file listing of a search path's directory.
	 */
	[CCode (cname = "PHYSFS_enumerateFiles")]
	public unowned string?[] enumerate_files(string dir);
	
	/**
	 * \fn int PHYSFS_exists(const char *fname)
	 * \brief Determine if a file exists in the search path.
	 */
	[CCode (cname = "PHYSFS_exists")]
	public bool exists(string fname);
		
	/**
	 * \fn int PHYSFS_isDirectory(const char *fname)
	 * \brief Determine if a file in the search path is really a directory.
	 */
	[CCode (cname = "PHYSFS_isDirectory")]
	public bool is_directory(string fname);	

	/**
	* \fn int PHYSFS_isSymbolicLink(const char *fname)
	* \brief Determine if a file in the search path is really a symbolic link.
	*/
	[CCode (cname = "PHYSFS_isSymbolicLink")]
	public bool is_symbolic_link(string fname) ;

	/**
	* \fn int64 PHYSFS_getLastModTime(const char *filename)
	* \brief Get the last modification time of a file.
	*/
	[CCode (cname = "PHYSFS_getLastModTime")]
	public int64 get_last_mod_time(string filename);
		
	/* i/o stuff... */
	
	/**
	* \fn File* PHYSFS_openWrite(const char *filename)
	* \brief Open a file for writing.
	*/
	[CCode (cname = "PHYSFS_openWrite")]
	public File* open_write(string filename);
		
	/**
	* \fn File* PHYSFS_openAppend(const char *filename)
	* \brief Open a file for appending.
	*/
	[CCode (cname = "PHYSFS_openAppend")]
	public File* open_append(string filename);
		
	/**
	* \fn File* PHYSFS_openRead(const char *filename)
	* \brief Open a file for reading.
	*/
	[CCode (cname = "PHYSFS_openRead")]
	public File* open_read(string filename);
		
	/**
	* \fn int PHYSFS_close(File* handle)
	* \brief Close a PhysicsFS filehandle.
	*/
	[CCode (cname = "PHYSFS_close")]
	public bool close(File* handle);
		
	/**
	* \fn int64 PHYSFS_read(File* handle, void *buffer, uint32 objSize, uint32 objCount)
	* \brief Read data from a PhysicsFS filehandle
	*/
	[CCode (cname = "PHYSFS_read")]
	public int64 read(File* handle, uint8[] buffer, uint32 obj_size, uint32 obj_count);
	
	/**
	* \fn int64 PHYSFS_write(File* handle, const void *buffer, uint32 objSize, uint32 objCount)
	* \brief Write data to a PhysicsFS filehandle
	*/
	[CCode (cname = "PHYSFS_write")]
	public int64 write(File* handle, uint8[] buffer, uint32 obj_size, uint32 obj_count);
		
	/* File position stuff... */
	
	/**
	* \fn int PHYSFS_eof(File* handle)
	* \brief Check for end-of-file state on a PhysicsFS filehandle.
	*/
	[CCode (cname = "PHYSFS_eof")]
	public bool eof(File* handle);	
	
	/**
	* \fn int64 PHYSFS_tell(File* handle)
	* \brief Determine current position within a PhysicsFS filehandle.
	*/
	[CCode (cname = "PHYSFS_tell")]
	public int64 tell(File* handle);
		
	/**
	* \fn int PHYSFS_seek(File* handle, uint64 pos)
	* \brief Seek to a new position within a PhysicsFS filehandle.
	*/
	[CCode (cname = "PHYSFS_seek")]
	public bool seek(File* handle, uint64 pos);
		
	/**
	* \fn int64 FileLength(File* handle)
	* \brief Get total length of a file in bytes.
	*/
	[CCode (cname = "PHYSFS_fileLength")]
	public int64 file_length(File* handle);	
	
	/* Buffering stuff... */
	
	/**
	* \fn int PHYSFS_setBuffer(File* handle, uint64 bufsize)
	* \brief Set up buffering for a PhysicsFS file handle.
	*/
	[CCode (cname = "PHYSFS_setBuffer")]
	public bool set_buffer(File* handle, uint64 buf_size);
		
	/**
	* \fn int PHYSFS_flush(File* handle)
	* \brief Flush a buffered PhysicsFS file handle.
	*/
	[CCode (cname = "PHYSFS_flush")]
	public bool flush(File* handle);
		
	/* Byteorder stuff... */
	
	/**
	* \fn int16 PHYSFS_swapSLE16(int16 val)
	* \brief Swap littleendian signed 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSLE16")]
	public int16 swapSLE16(int16 val);
	
	
	/**
	* \fn uint16 PHYSFS_swapULE16(uint16 val)
	* \brief Swap littleendian unsigned 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapULE16")]
	public uint16 swapULE16(uint16 val);
	
	/**
	* \fn int32 PHYSFS_swapSLE32(int32 val)
	* \brief Swap littleendian signed 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSLE32")]
	public int32 swapSLE32(int32 val);
	
	
	/**
	* \fn uint32 PHYSFS_swapULE32(uint32 val)
	* \brief Swap littleendian unsigned 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapULE32")]
	public uint32 swapULE32(uint32 val);
	
	/**
	* \fn int64 PHYSFS_swapSLE64(int64 val)
	* \brief Swap littleendian signed 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSLE64")]
	public int64 swapSLE64(int64 val);
	
	/**
	* \fn uint64 PHYSFS_swapULE64(uint64 val)
	* \brief Swap littleendian unsigned 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapULE64")]
	public uint64 swapULE64(uint64 val);
	
	/**
	* \fn int16 PHYSFS_swapSBE16(int16 val)
	* \brief Swap bigendian signed 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSBE16")]
	public int16 swapSBE16(int16 val);
	
	/**
	* \fn uint16 PHYSFS_swapUBE16(uint16 val)
	* \brief Swap bigendian unsigned 16 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapUBE16")]
	public uint16 swapUBE16(uint16 val);
	
	/**
	* \fn int32 PHYSFS_swapSBE32(int32 val)
	* \brief Swap bigendian signed 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSBE32")]
	public int32 swapSBE32(int32 val);
	
	/**
	* \fn uint32 PHYSFS_swapUBE32(uint32 val)
	* \brief Swap bigendian unsigned 32 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapUBE32")]
	public uint32 swapUBE32(uint32 val);
	
	/**
	* \fn int64 PHYSFS_swapSBE64(int64 val)
	* \brief Swap bigendian signed 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapSBE64")]
	public int64 swapSBE64(int64 val);
	
	/**
	* \fn uint64 PHYSFS_swapUBE64(uint64 val)
	* \brief Swap bigendian unsigned 64 to platform's native byte order.
	*/
	[CCode (cname = "PHYSFS_swapUBE64")]
	public uint64 swapUBE64(uint64 val);
	
	/**
	* \fn int PHYSFS_readSLE16(File* file, int16 *val)
	* \brief Read and convert a signed 16-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_readSLE16")]
	public bool readSLE16(File* file, out int16 val);	
	
	/**
	* \fn int PHYSFS_readULE16(File* file, uint16 *val)
	* \brief Read and convert an unsigned 16-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_readULE16")]
	public bool readULE16(File* file, out uint16 val);	
	
	/**
	* \fn int PHYSFS_readSBE16(File* file, int16 *val)
	* \brief Read and convert a signed 16-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_readSBE16")]
	public bool readSBE16(File* file, out int16 val);	
	
	/**
	* \fn int PHYSFS_readUBE16(File* file, uint16 *val)
	* \brief Read and convert an unsigned 16-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_readUBE16")]
	public bool readUBE16(File* file, out uint16 val);	
	
	/**
	* \fn int PHYSFS_readSLE32(File* file, int32 *val)
	* \brief Read and convert a signed 32-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_readSLE32")]
	public bool readSLE32(File* file, out int32 val);	
	
	/**
	* \fn int PHYSFS_readULE32(File* file, uint32 *val)
	* \brief Read and convert an unsigned 32-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_readULE32")]
	public bool readULE32(File* file, out uint32 val);	
	
	/**
	* \fn int PHYSFS_readSBE32(File* file, int32 *val)
	* \brief Read and convert a signed 32-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_readSBE32")]
	public bool readSBE32(File* file, out int32 val);	
	
	/**
	* \fn int PHYSFS_readUBE32(File* file, uint32 *val)
	* \brief Read and convert an unsigned 32-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_readUBE32")]
	public bool readUBE32(File* file, out uint32 val);	
	
	/**
	* \fn int PHYSFS_readSLE64(File* file, int64 *val)
	* \brief Read and convert a signed 64-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_readSLE64")]
	public bool readSLE64(File* file, out int64 val);	
	
	/**
	* \fn int PHYSFS_readULE64(File* file, uint64 *val)
	* \brief Read and convert an unsigned 64-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_readULE64")]
	public bool readULE64(File* file, out uint64 val);	
	
	/**
	* \fn int PHYSFS_readSBE64(File* file, int64 *val)
	* \brief Read and convert a signed 64-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_readSBE64")]
	public bool readSBE64(File* file, out int64 val);	
	
	/**
	* \fn int PHYSFS_readUBE64(File* file, uint64 *val)
	* \brief Read and convert an unsigned 64-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_readUBE64")]
	public bool readUBE64(File* file, out uint64 val);	
	
	/**
	* \fn int PHYSFS_writeSLE16(File* file, int16 val)
	* \brief Convert and write a signed 16-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_writeSLE16")]
	public bool writeSLE16(File* file, int16 val);	
	
	/**
	* \fn int PHYSFS_writeULE16(File* file, uint16 val)
	* \brief Convert and write an unsigned 16-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_writeULE16")]
	public bool writeULE16(File* file, uint16 val);	
	
	/**
	* \fn int PHYSFS_writeSBE16(File* file, int16 val)
	* \brief Convert and write a signed 16-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_writeSBE16")]
	public bool writeSBE16(File* file, int16 val);	
	
	/**
	* \fn int PHYSFS_writeUBE16(File* file, uint16 val)
	* \brief Convert and write an unsigned 16-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_writeUBE16")]
	public bool writeUBE16(File* file, uint16 val);	
	
	/**
	* \fn int PHYSFS_writeSLE32(File* file, int32 val)
	* \brief Convert and write a signed 32-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_writeSLE32")]
	public bool writeSLE32(File* file, int32 val);	
	
	/**
	* \fn int PHYSFS_writeULE32(File* file, uint32 val)
	* \brief Convert and write an unsigned 32-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_writeULE32")]
	public bool writeULE32(File* file, uint32 val);	
	
	/**
	* \fn int PHYSFS_writeSBE32(File* file, int32 val)
	* \brief Convert and write a signed 32-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_writeSBE32")]
	public bool writeSBE32(File* file, int32 val);	
	
	/**
	* \fn int PHYSFS_writeUBE32(File* file, uint32 val)
	* \brief Convert and write an unsigned 32-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_writeUBE32")]
	public bool writeUBE32(File* file, uint32 val);	
	
	/**
	* \fn int PHYSFS_writeSLE64(File* file, int64 val)
	* \brief Convert and write a signed 64-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_writeSLE64")]
	public bool writeSLE64(File* file, int64 val);	
	
	/**
	* \fn int PHYSFS_writeULE64(File* file, uint64 val)
	* \brief Convert and write an unsigned 64-bit littleendian value.
	*/
	[CCode (cname = "PHYSFS_writeULE64")]
	public bool writeULE64(File* file, uint64 val);	
	
	/**
	* \fn int PHYSFS_writeSBE64(File* file, int64 val)
	* \brief Convert and write a signed 64-bit bigending value.
	*/
	[CCode (cname = "PHYSFS_writeSBE64")]
	public bool writeSBE64(File* file, int64 val);	
	
	/**
	* \fn int PHYSFS_writeUBE64(File* file, uint64 val)
	* \brief Convert and write an unsigned 64-bit bigendian value.
	*/
	[CCode (cname = "PHYSFS_writeUBE64")]
	public bool writeUBE64(File* file, uint64 val);	
	
	/* Everything above this line is part of the PhysicsFS 1.0 API. */
	
	/**
	* \fn int PHYSFS_isInit()
	* \brief Determine if the PhysicsFS library is initialized.
	*/
	[CCode (cname = "PHYSFS_isInit")]
	public bool is_init();	
	
	/**
	* \fn int PHYSFS_symbolicLinksPermitted()
	* \brief Determine if the symbolic links are permitted.
	*/
	[CCode (cname = "PHYSFS_symbolicLinksPermitted")]
	public bool symbolic_links_permitted();

	public delegate int Init();   /**< Initialize. Can be NULL. Zero on failure. */
	public delegate void Deinit();  /**< Deinitialize your allocator. Can be NULL. */
	public delegate void* Malloc(uint64 size);  /**< Allocate like malloc(). */
	public delegate void* Realloc(void* dst, uint64 size); /**< Reallocate like realloc(). */
	public delegate void Free(void* pointer); /**< Free memory from Malloc or Realloc. */
	/**
	* \struct PHYSFS_Allocator
	* \brief PhysicsFS allocation function pointers.
	*/
	public struct Allocator {
		Init init_func;       /**< Initialize. Can be NULL. Zero on failure. */
		Deinit deinit_func;   /**< Deinitialize your allocator. Can be NULL. */
		Malloc malloc_func;   /**< Allocate like malloc(). */
		Realloc realloc_func; /**< Reallocate like realloc(). */
		Free free_func; 	     /**< Free memory from Malloc or Realloc. */
	}

	/**
	* \fn int PHYSFS_setAllocator(const PHYSFS_Allocator *allocator)
	* \brief Hook your own allocation routines into PhysicsFS.
	*/
	public bool set_allocator(Allocator* allocator);
		
	/**
	* \fn int PHYSFS_mount(const char *newDir, const char *mountPoint, int appendToPath)
	* \brief Add an archive or directory to the search path.
	*/
	[CCode (cname = "PHYSFS_mount")]
	public bool mount(string new_dir, string mountPoint, bool append_to_path);
	
	/**
	* \fn int PHYSFS_getMountPoint(const char *dir)
	* \brief Determine a mounted archive's mountpoint.
	*/
	[CCode (cname = "PHYSFS_getMountPoint")]
	public unowned string? get_mount_point(string dir);	
	
	/**
	* \typedef PHYSFS_StringCallback
	* \brief Function signature for callbacks that report strings.
	*/
	[CCode (cname = "PHYSFS_StringCallback", has_target = false)]
	public delegate void StringCallback (void* data, string str);	
	
	/**
	* \typedef PHYSFS_EnumFilesCallback
	* \brief Function signature for callbacks that enumerate files.
	*/
	[CCode (cname = "PHYSFS_EnumFilesCallback", has_target = false)]
	public delegate void EnumFilesCallback (void* data, string origdir, string fname);
		
	/**
	* \fn void PHYSFS_getCdRomDirsCallback(PHYSFS_StringCallback c, void *d)
	* \brief Enumerate CD-ROM directories, using an application-defined callback.
	*/
	[CCode (cname = "PHYSFS_getCdRomDirsCallback")]
	public void get_cdrom_dirs_callback(StringCallback c, void* d);	
	
	/**
	* \fn void PHYSFS_getSearchPathCallback(PHYSFS_StringCallback c, void *d)
	* \brief Enumerate the search path, using an application-defined callback.
	*/
	[CCode (cname = "PHYSFS_getSearchPathCallback")]
	public void get_search_path_callback(StringCallback c, void* d);	
	
	/**
	* \fn void PHYSFS_enumerateFilesCallback(const char *dir, PHYSFS_EnumFilesCallback c, void *d)
	* \brief Get a file listing of a search path's directory, using an application-defined callback.
	*/
	[CCode (cname = "PHYSFS_enumerateFilesCallback")]
	public void enumerate_files_callback(string dir, EnumFilesCallback c, void *d) ;
	
	/**
	* \fn void PHYSFS_utf8FromUcs4(const uint32 *src, char *dst, uint64 len)
	* \brief Convert a UCS-4 string to a UTF-8 string.
	*/
	[CCode (cname = "PHYSFS_utf8FromUcs4")]
	public void utf8_from_ucs4(uint32[] src, out string dst, uint64 len);
	
	/**
	* \fn void PHYSFS_utf8ToUcs4(const char *src, uint32 *dst, uint64 len)
	* \brief Convert a UTF-8 string to a UCS-4 string.
	*/
	[CCode (cname = "PHYSFS_utf8ToUcs4")]
	public void utf8_to_ucs4(string src, out uint32[] dst, uint64 len);
	
	/**
	* \fn void PHYSFS_utf8FromUcs2(const uint16 *src, char *dst, uint64 len)
	* \brief Convert a UCS-2 string to a UTF-8 string.
	*
	* \warning you almost certainly should use PHYSFS_utf8FromUtf16(), which
	*  became available in PhysicsFS 2.1, unless you know what you're doing.
	*
	* \warning This function will not report an error if there are invalid UCS-2
	*          values in the source string. It will replace them with a '?'
	*          character and continue on.
	*
	* UCS-2 strings are 16-bits per character: \c TCHAR on Windows, when building
	*  with Unicode support. Please note that modern versions of Windows use
	*  UTF-16, which is an extended form of UCS-2, and not UCS-2 itself. You
	*  almost certainly want PHYSFS_utf8FromUtf16() instead.
	*
	* To ensure that the destination buffer is large enough for the conversion,
	*  please allocate a buffer that is double the size of the source buffer.
	*  UTF-8 never uses more than 32-bits per character, so while it may shrink
	*  a UCS-2 string, it may also expand it.
	*
	* Strings that don't fit in the destination buffer will be truncated, but
	*  will always be null-terminated and never have an incomplete UTF-8
	*  sequence at the end. If the buffer length is 0, this function does nothing.
	*
	*   \param src Null-terminated source string in UCS-2 format.
	*   \param dst Buffer to store converted UTF-8 string.
	*   \param len Size, in bytes, of destination buffer.
	*
	* \sa PHYSFS_utf8FromUtf16
	*/
	public void PHYSFS_utf8FromUcs2(const uint16 *src, char *dst,
										uint64 len);
	
	/**
	* \fn PHYSFS_utf8ToUcs2(const char *src, uint16 *dst, uint64 len)
	* \brief Convert a UTF-8 string to a UCS-2 string.
	*
	* \warning you almost certainly should use PHYSFS_utf8ToUtf16(), which
	*  became available in PhysicsFS 2.1, unless you know what you're doing.
	*
	* \warning This function will not report an error if there are invalid UTF-8
	*          sequences in the source string. It will replace them with a '?'
	*          character and continue on.
	*
	* UCS-2 strings are 16-bits per character: \c TCHAR on Windows, when building
	*  with Unicode support. Please note that modern versions of Windows use
	*  UTF-16, which is an extended form of UCS-2, and not UCS-2 itself. You
	*  almost certainly want PHYSFS_utf8ToUtf16() instead, but you need to
	*  understand how that changes things, too.
	*
	* To ensure that the destination buffer is large enough for the conversion,
	*  please allocate a buffer that is double the size of the source buffer.
	*  UTF-8 uses from one to four bytes per character, but UCS-2 always uses
	*  two, so an entirely low-ASCII string will double in size!
	*
	* Strings that don't fit in the destination buffer will be truncated, but
	*  will always be null-terminated and never have an incomplete UCS-2
	*  sequence at the end. If the buffer length is 0, this function does nothing.
	*
	*   \param src Null-terminated source string in UTF-8 format.
	*   \param dst Buffer to store converted UCS-2 string.
	*   \param len Size, in bytes, of destination buffer.
	*
	* \sa PHYSFS_utf8ToUtf16
	*/
	public void PHYSFS_utf8ToUcs2(const char *src, uint16 *dst,
										uint64 len);
	
	/**
	* \fn void PHYSFS_utf8FromLatin1(const char *src, char *dst, uint64 len)
	* \brief Convert a UTF-8 string to a Latin1 string.
	*
	* Latin1 strings are 8-bits per character: a popular "high ASCII" encoding.
	*
	* To ensure that the destination buffer is large enough for the conversion,
	*  please allocate a buffer that is double the size of the source buffer.
	*  UTF-8 expands latin1 codepoints over 127 from 1 to 2 bytes, so the string
	*  may grow in some cases.
	*
	* Strings that don't fit in the destination buffer will be truncated, but
	*  will always be null-terminated and never have an incomplete UTF-8
	*  sequence at the end. If the buffer length is 0, this function does nothing.
	*
	* Please note that we do not supply a UTF-8 to Latin1 converter, since Latin1
	*  can't express most Unicode codepoints. It's a legacy encoding; you should
	*  be converting away from it at all times.
	*
	*   \param src Null-terminated source string in Latin1 format.
	*   \param dst Buffer to store converted UTF-8 string.
	*   \param len Size, in bytes, of destination buffer.
	*/
	public void PHYSFS_utf8FromLatin1(const char *src, char *dst,
											uint64 len);
	
	/* Everything above this line is part of the PhysicsFS 2.0 API. */
	
	/**
	* \fn int PHYSFS_caseFold(const uint32 from, uint32 *to)
	* \brief "Fold" a Unicode codepoint to a lowercase equivalent.
	*
	* (This is for limited, hardcore use. If you don't immediately see a need
	*  for it, you can probably ignore this forever.)
	*
	* This will convert a Unicode codepoint into its lowercase equivalent.
	*  Bogus codepoints and codepoints without a lowercase equivalent will
	*  be returned unconverted.
	*
	* Note that you might get multiple codepoints in return! The German Eszett,
	*  for example, will fold down to two lowercase latin 's' codepoints. The
	*  theory is that if you fold two strings, one with an Eszett and one with
	*  "SS" down, they will match.
	*
	* \warning Anyone that is a student of Unicode knows about the "Turkish I"
	*          problem. This API does not handle it. Assume this one letter
	*          in all of Unicode will definitely fold sort of incorrectly. If
	*          you don't know what this is about, you can probably ignore this
	*          problem for most of the planet, but perfection is impossible.
	*
	*   \param from The codepoint to fold.
	*   \param to Buffer to store the folded codepoint values into. This should
	*             point to space for at least 3 uint32 slots.
	*  \return The number of codepoints the folding produced. Between 1 and 3.
	*/
	public int PHYSFS_caseFold(const uint32 from, uint32 *to);
	
	
	/**
	* \fn int PHYSFS_utf8stricmp(const char *str1, const char *str2)
	* \brief Case-insensitive compare of two UTF-8 strings.
	*
	* This is a strcasecmp/stricmp replacement that expects both strings
	*  to be in UTF-8 encoding. It will do "case folding" to decide if the
	*  Unicode codepoints in the strings match.
	*
	* If both strings are exclusively low-ASCII characters, this will do the
	*  right thing, as that is also valid UTF-8. If there are any high-ASCII
	*  chars, this will not do what you expect!
	*
	* It will report which string is "greater than" the other, but be aware that
	*  this doesn't necessarily mean anything: 'a' may be "less than" 'b', but
	*  a Japanese kuten has no meaningful alphabetically relationship to
	*  a Greek lambda, but being able to assign a reliable "value" makes sorting
	*  algorithms possible, if not entirely sane. Most cases should treat the
	*  return value as "equal" or "not equal".
	*
	* Like stricmp, this expects both strings to be NULL-terminated.
	*
	*   \param str1 First string to compare.
	*   \param str2 Second string to compare.
	*  \return -1 if str1 is "less than" str2, 1 if "greater than", 0 if equal.
	*/
	public int PHYSFS_utf8stricmp(const char *str1, const char *str2);
	
	/**
	* \fn int PHYSFS_utf16stricmp(const uint16 *str1, const uint16 *str2)
	* \brief Case-insensitive compare of two UTF-16 strings.
	*
	* This is a strcasecmp/stricmp replacement that expects both strings
	*  to be in UTF-16 encoding. It will do "case folding" to decide if the
	*  Unicode codepoints in the strings match.
	*
	* It will report which string is "greater than" the other, but be aware that
	*  this doesn't necessarily mean anything: 'a' may be "less than" 'b', but
	*  a Japanese kuten has no meaningful alphabetically relationship to
	*  a Greek lambda, but being able to assign a reliable "value" makes sorting
	*  algorithms possible, if not entirely sane. Most cases should treat the
	*  return value as "equal" or "not equal".
	*
	* Like stricmp, this expects both strings to be NULL-terminated.
	*
	*   \param str1 First string to compare.
	*   \param str2 Second string to compare.
	*  \return -1 if str1 is "less than" str2, 1 if "greater than", 0 if equal.
	*/
	public int PHYSFS_utf16stricmp(const uint16 *str1,
										const uint16 *str2);
	
	/**
	* \fn int PHYSFS_ucs4stricmp(const uint32 *str1, const uint32 *str2)
	* \brief Case-insensitive compare of two UCS-4 strings.
	*
	* This is a strcasecmp/stricmp replacement that expects both strings
	*  to be in UCS-4 (aka UTF-32) encoding. It will do "case folding" to decide
	*  if the Unicode codepoints in the strings match.
	*
	* It will report which string is "greater than" the other, but be aware that
	*  this doesn't necessarily mean anything: 'a' may be "less than" 'b', but
	*  a Japanese kuten has no meaningful alphabetically relationship to
	*  a Greek lambda, but being able to assign a reliable "value" makes sorting
	*  algorithms possible, if not entirely sane. Most cases should treat the
	*  return value as "equal" or "not equal".
	*
	* Like stricmp, this expects both strings to be NULL-terminated.
	*
	*   \param str1 First string to compare.
	*   \param str2 Second string to compare.
	*  \return -1 if str1 is "less than" str2, 1 if "greater than", 0 if equal.
	*/
	public int PHYSFS_ucs4stricmp(const uint32 *str1,
										const uint32 *str2);
	
	
	/**
	* \typedef PHYSFS_EnumerateCallback
	* \brief Possible return values from PHYSFS_EnumerateCallback.
	*
	* These values dictate if an enumeration callback should continue to fire,
	*  or stop (and why it is stopping).
	*
	* \sa PHYSFS_EnumerateCallback
	* \sa PHYSFS_enumerate
	*/
	typedef enum PHYSFS_EnumerateCallbackResult
	{
		PHYSFS_ENUM_ERROR = -1,   /**< Stop enumerating, report error to app. */
		PHYSFS_ENUM_STOP = 0,     /**< Stop enumerating, report success to app. */
		PHYSFS_ENUM_OK = 1        /**< Keep enumerating, no problems */
	} PHYSFS_EnumerateCallbackResult;
	
	/**
	* \typedef PHYSFS_EnumerateCallback
	* \brief Function signature for callbacks that enumerate and return results.
	*
	* This is the same thing as PHYSFS_EnumFilesCallback from PhysicsFS 2.0,
	*  except it can return a result from the callback: namely: if you're looking
	*  for something specific, once you find it, you can tell PhysicsFS to stop
	*  enumerating further. This is used with PHYSFS_enumerate(), which we
	*  hopefully got right this time.  :)
	*
	*    \param data User-defined data pointer, passed through from the API
	*                that eventually called the callback.
	*    \param origdir A string containing the full path, in platform-independent
	*                   notation, of the directory containing this file. In most
	*                   cases, this is the directory on which you requested
	*                   enumeration, passed in the callback for your convenience.
	*    \param fname The filename that is being enumerated. It may not be in
	*                 alphabetical order compared to other callbacks that have
	*                 fired, and it will not contain the full path. You can
	*                 recreate the fullpath with $origdir/$fname ... The file
	*                 can be a subdirectory, a file, a symlink, etc.
	*   \return A value from PHYSFS_EnumerateCallbackResult.
	*           All other values are (currently) undefined; don't use them.
	*
	* \sa PHYSFS_enumerate
	* \sa PHYSFS_EnumerateCallbackResult
	*/
	typedef PHYSFS_EnumerateCallbackResult (*PHYSFS_EnumerateCallback)(void *data,
											const char *origdir, const char *fname);
	
	/**
	* \fn int PHYSFS_enumerate(const char *dir, PHYSFS_EnumerateCallback c, void *d)
	* \brief Get a file listing of a search path's directory, using an application-defined callback, with errors reported.
	*
	* Internally, PHYSFS_enumerateFiles() just calls this function and then builds
	*  a list before returning to the application, so functionality is identical
	*  except for how the information is represented to the application.
	*
	* Unlike PHYSFS_enumerateFiles(), this function does not return an array.
	*  Rather, it calls a function specified by the application once per
	*  element of the search path:
	*
	* \code
	*
	* static int printDir(void *data, const char *origdir, const char *fname)
	* {
	*     printf(" * We've got [%s] in [%s].\n", fname, origdir);
	*     return 1;  // give me more data, please.
	* }
	*
	* // ...
	* PHYSFS_enumerate("/some/path", printDir, NULL);
	* \endcode
	*
	* Items sent to the callback are not guaranteed to be in any order whatsoever.
	*  There is no sorting done at this level, and if you need that, you should
	*  probably use PHYSFS_enumerateFiles() instead, which guarantees
	*  alphabetical sorting. This form reports whatever is discovered in each
	*  archive before moving on to the next. Even within one archive, we can't
	*  guarantee what order it will discover data. <em>Any sorting you find in
	*  these callbacks is just pure luck. Do not rely on it.</em> As this walks
	*  the entire list of archives, you may receive duplicate filenames.
	*
	* This API and the callbacks themselves are capable of reporting errors.
	*  Prior to this API, callbacks had to accept every enumerated item, even if
	*  they were only looking for a specific thing and wanted to stop after that,
	*  or had a serious error and couldn't alert anyone. Furthermore, if
	*  PhysicsFS itself had a problem (disk error or whatnot), it couldn't report
	*  it to the calling app, it would just have to skip items or stop
	*  enumerating outright, and the caller wouldn't know it had lost some data
	*  along the way.
	*
	* Now the caller can be sure it got a complete data set, and its callback has
	*  control if it wants enumeration to stop early. See the documentation for
	*  PHYSFS_EnumerateCallback for details on how your callback should behave.
	*
	*    \param dir Directory, in platform-independent notation, to enumerate.
	*    \param c Callback function to notify about search path elements.
	*    \param d Application-defined data passed to callback. Can be NULL.
	*   \return non-zero on success, zero on failure. Use
	*           PHYSFS_getLastErrorCode() to obtain the specific error. If the
	*           callback returns PHYSFS_ENUM_STOP to stop early, this will be
	*           considered success. Callbacks returning PHYSFS_ENUM_ERROR will
	*           make this function return zero and set the error code to
	*           PHYSFS_ERR_APP_CALLBACK.
	*
	* \sa PHYSFS_EnumerateCallback
	* \sa PHYSFS_enumerateFiles
	*/
	public bool PHYSFS_enumerate(const char *dir, PHYSFS_EnumerateCallback c,
									void *d);
	
	
	/**
	* \fn int PHYSFS_unmount(const char *oldDir)
	* \brief Remove a directory or archive from the search path.
	*
	* This is functionally equivalent to PHYSFS_removeFromSearchPath(), but that
	*  function is deprecated to keep the vocabulary paired with PHYSFS_mount().
	*
	* This must be a (case-sensitive) match to a dir or archive already in the
	*  search path, specified in platform-dependent notation.
	*
	* This call will fail (and fail to remove from the path) if the element still
	*  has files open in it.
	*
	* \warning This function wants the path to the archive or directory that was
	*          mounted (the same string used for the "newDir" argument of
	*          PHYSFS_addToSearchPath or any of the mount functions), not the
	*          path where it is mounted in the tree (the "mountPoint" argument
	*          to any of the mount functions).
	*
	*    \param oldDir dir/archive to remove.
	*   \return nonzero on success, zero on failure. Use
	*           PHYSFS_getLastErrorCode() to obtain the specific error.
	*
	* \sa PHYSFS_getSearchPath
	* \sa PHYSFS_mount
	*/
	public bool PHYSFS_unmount(const char *oldDir);
	
	
	/**
	* \fn const PHYSFS_Allocator *PHYSFS_getAllocator()
	* \brief Discover the current allocator.
	*
	* (This is for limited, hardcore use. If you don't immediately see a need
	*  for it, you can probably ignore this forever.)
	*
	* This function exposes the function pointers that make up the currently used
	*  allocator. This can be useful for apps that want to access PhysicsFS's
	*  internal, default allocation routines, as well as for external code that
	*  wants to share the same allocator, even if the application specified their
	*  own.
	*
	* This call is only valid between PHYSFS_init() and PHYSFS_deinit() calls;
	*  it will return NULL if the library isn't initialized. As we can't
	*  guarantee the state of the internal allocators unless the library is
	*  initialized, you shouldn't use any allocator returned here after a call
	*  to PHYSFS_deinit().
	*
	* Do not call the returned allocator's Init() or Deinit() methods under any
	*  circumstances.
	*
	* If you aren't immediately sure what to do with this function, you can
	*  safely ignore it altogether.
	*
	*  \return Current allocator, as set by PHYSFS_setAllocator(), or PhysicsFS's
	*          internal, default allocator if no application defined allocator
	*          is currently set. Will return NULL if the library is not
	*          initialized.
	*
	* \sa PHYSFS_Allocator
	* \sa PHYSFS_setAllocator
	*/
	public const PHYSFS_Allocator *PHYSFS_getAllocator();
	
	
	/**
	* \enum FileType
	* \brief Type of a File
	*
	* Possible types of a file.
	*
	* \sa PHYSFS_stat
	*/
	typedef enum FileType
	{
		FileTYPE_REGULAR, /**< a normal File* /
		FileTYPE_DIRECTORY, /**< a directory */
		FileTYPE_SYMLINK, /**< a symlink */
		FileTYPE_OTHER /**< something completely different like a device */
	} FileType;
	
	/**
	* \struct PHYSFS_Stat
	* \brief Meta data for a file or directory
	*
	* Container for various meta data about a file in the virtual file system.
	*  PHYSFS_stat() uses this structure for returning the information. The time
	*  data will be either the number of seconds since the Unix epoch (midnight,
	*  Jan 1, 1970), or -1 if the information isn't available or applicable.
	*  The (filesize) field is measured in bytes.
	*  The (readonly) field tells you whether the archive thinks a file is
	*  not writable, but tends to be only an estimate (for example, your write
	*  dir might overlap with a .zip file, meaning you _can_ successfully open
	*  that path for writing, as it gets created elsewhere.
	*
	* \sa PHYSFS_stat
	* \sa FileType
	*/
	typedef struct PHYSFS_Stat
	{
		int64 filesize; /**< size in bytes, -1 for non-files and unknown */
		int64 modtime;  /**< last modification time */
		int64 createtime; /**< like modtime, but for file creation time */
		int64 accesstime; /**< like modtime, but for file access time */
		FileType filetype; /**< File? Directory? Symlink? */
		int readonly; /**< non-zero if read only, zero if writable. */
	} PHYSFS_Stat;
	
	/**
	* \fn int PHYSFS_stat(const char *fname, PHYSFS_Stat *stat)
	* \brief Get various information about a directory or a file.
	*
	* Obtain various information about a file or directory from the meta data.
	*
	* This function will never follow symbolic links. If you haven't enabled
	*  symlinks with PHYSFS_permitSymbolicLinks(), stat'ing a symlink will be
	*  treated like stat'ing a non-existant file. If symlinks are enabled,
	*  stat'ing a symlink will give you information on the link itself and not
	*  what it points to.
	*
	*    \param fname filename to check, in platform-indepedent notation.
	*    \param stat pointer to structure to fill in with data about (fname).
	*   \return non-zero on success, zero on failure. On failure, (stat)'s
	*           contents are undefined.
	*
	* \sa PHYSFS_Stat
	*/
	public bool PHYSFS_stat(const char *fname, PHYSFS_Stat *stat);
	
	
	/**
	* \fn void PHYSFS_utf8FromUtf16(const uint16 *src, char *dst, uint64 len)
	* \brief Convert a UTF-16 string to a UTF-8 string.
	*
	* \warning This function will not report an error if there are invalid UTF-16
	*          sequences in the source string. It will replace them with a '?'
	*          character and continue on.
	*
	* UTF-16 strings are 16-bits per character (except some chars, which are
	*  32-bits): \c TCHAR on Windows, when building with Unicode support. Modern
	*  Windows releases use UTF-16. Windows releases before 2000 used TCHAR, but
	*  only handled UCS-2. UTF-16 _is_ UCS-2, except for the characters that
	*  are 4 bytes, which aren't representable in UCS-2 at all anyhow. If you
	*  aren't sure, you should be using UTF-16 at this point on Windows.
	*
	* To ensure that the destination buffer is large enough for the conversion,
	*  please allocate a buffer that is double the size of the source buffer.
	*  UTF-8 never uses more than 32-bits per character, so while it may shrink
	*  a UTF-16 string, it may also expand it.
	*
	* Strings that don't fit in the destination buffer will be truncated, but
	*  will always be null-terminated and never have an incomplete UTF-8
	*  sequence at the end. If the buffer length is 0, this function does nothing.
	*
	*   \param src Null-terminated source string in UTF-16 format.
	*   \param dst Buffer to store converted UTF-8 string.
	*   \param len Size, in bytes, of destination buffer.
	*/
	public void PHYSFS_utf8FromUtf16(const uint16 *src, char *dst,
										uint64 len);
	
	/**
	* \fn PHYSFS_utf8ToUtf16(const char *src, uint16 *dst, uint64 len)
	* \brief Convert a UTF-8 string to a UTF-16 string.
	*
	* \warning This function will not report an error if there are invalid UTF-8
	*          sequences in the source string. It will replace them with a '?'
	*          character and continue on.
	*
	* UTF-16 strings are 16-bits per character (except some chars, which are
	*  32-bits): \c TCHAR on Windows, when building with Unicode support. Modern
	*  Windows releases use UTF-16. Windows releases before 2000 used TCHAR, but
	*  only handled UCS-2. UTF-16 _is_ UCS-2, except for the characters that
	*  are 4 bytes, which aren't representable in UCS-2 at all anyhow. If you
	*  aren't sure, you should be using UTF-16 at this point on Windows.
	*
	* To ensure that the destination buffer is large enough for the conversion,
	*  please allocate a buffer that is double the size of the source buffer.
	*  UTF-8 uses from one to four bytes per character, but UTF-16 always uses
	*  two to four, so an entirely low-ASCII string will double in size! The
	*  UTF-16 characters that would take four bytes also take four bytes in UTF-8,
	*  so you don't need to allocate 4x the space just in case: double will do.
	*
	* Strings that don't fit in the destination buffer will be truncated, but
	*  will always be null-terminated and never have an incomplete UTF-16
	*  surrogate pair at the end. If the buffer length is 0, this function does
	*  nothing.
	*
	*   \param src Null-terminated source string in UTF-8 format.
	*   \param dst Buffer to store converted UTF-16 string.
	*   \param len Size, in bytes, of destination buffer.
	*
	* \sa PHYSFS_utf8ToUtf16
	*/
	public void PHYSFS_utf8ToUtf16(const char *src, uint16 *dst,
										uint64 len);
	
	
	/**
	* \fn int64 PHYSFS_readBytes(File* handle, void *buffer, uint64 len)
	* \brief Read bytes from a PhysicsFS filehandle
	*
	* The file must be opened for reading.
	*
	*   \param handle handle returned from PHYSFS_openRead().
	*   \param buffer buffer of at least (len) bytes to store read data into.
	*   \param len number of bytes being read from (handle).
	*  \return number of bytes read. This may be less than (len); this does not
	*          signify an error, necessarily (a short read may mean EOF).
	*          PHYSFS_getLastErrorCode() can shed light on the reason this might
	*          be < (len), as can PHYSFS_eof(). -1 if complete failure.
	*
	* \sa PHYSFS_eof
	*/
	public int64 PHYSFS_readBytes(File* handle, void *buffer,
												uint64 len);
	
	/**
	* \fn int64 PHYSFS_writeBytes(File* handle, const void *buffer, uint64 len)
	* \brief Write data to a PhysicsFS filehandle
	*
	* The file must be opened for writing.
	*
	* Please note that while (len) is an unsigned 64-bit integer, you are limited
	*  to 63 bits (9223372036854775807 bytes), so we can return a negative value
	*  on error. If length is greater than 0x7FFFFFFFFFFFFFFF, this function will
	*  immediately fail. For systems without a 64-bit datatype, you are limited
	*  to 31 bits (0x7FFFFFFF, or 2147483647 bytes). We trust most things won't
	*  need to do multiple gigabytes of i/o in one call anyhow, but why limit
	*  things?
	*
	*   \param handle retval from PHYSFS_openWrite() or PHYSFS_openAppend().
	*   \param buffer buffer of (len) bytes to write to (handle).
	*   \param len number of bytes being written to (handle).
	*  \return number of bytes written. This may be less than (len); in the case
	*          of an error, the system may try to write as many bytes as possible,
	*          so an incomplete write might occur. PHYSFS_getLastErrorCode() can
	*          shed light on the reason this might be < (len). -1 if complete
	*          failure.
	*/
	public int64 PHYSFS_writeBytes(File* handle,
												const void *buffer,
												uint64 len);
	
	
	/**
	* \struct PHYSFS_Io
	* \brief An abstract i/o interface.
	*
	* \warning This is advanced, hardcore stuff. You don't need this unless you
	*          really know what you're doing. Most apps will not need this.
	*
	* Historically, PhysicsFS provided access to the physical filesystem and
	*  archives within that filesystem. However, sometimes you need more power
	*  than this. Perhaps you need to provide an archive that is entirely
	*  contained in RAM, or you need to bridge some other file i/o API to
	*  PhysicsFS, or you need to translate the bits (perhaps you have a
	*  a standard .zip file that's encrypted, and you need to decrypt on the fly
	*  for the unsuspecting zip archiver).
	*
	* A PHYSFS_Io is the interface that Archivers use to get archive data.
	*  Historically, this has mapped to file i/o to the physical filesystem, but
	*  as of PhysicsFS 2.1, applications can provide their own i/o implementations
	*  at runtime.
	*
	* This interface isn't necessarily a good universal fit for i/o. There are a
	*  few requirements of note:
	*
	*  - They only do blocking i/o (at least, for now).
	*  - They need to be able to duplicate. If you have a file handle from
	*    fopen(), you need to be able to create a unique clone of it (so we
	*    have two handles to the same file that can both seek/read/etc without
	*    stepping on each other).
	*  - They need to know the size of their entire data set.
	*  - They need to be able to seek and rewind on demand.
	*
	* ...in short, you're probably not going to write an HTTP implementation.
	*
	* Thread safety: PHYSFS_Io implementations are not guaranteed to be thread
	*  safe in themselves. Under the hood where PhysicsFS uses them, the library
	*  provides its own locks. If you plan to use them directly from separate
	*  threads, you should either use mutexes to protect them, or don't use the
	*  same PHYSFS_Io from two threads at the same time.
	*
	* \sa PHYSFS_mountIo
	*/
	typedef struct PHYSFS_Io
	{
		/**
		* \brief Binary compatibility information.
		*
		* This must be set to zero at this time. Future versions of this
		*  struct will increment this field, so we know what a given
		*  implementation supports. We'll presumably keep supporting older
		*  versions as we offer new features, though.
		*/
		uint32 version;
	
		/**
		* \brief Instance data for this struct.
		*
		* Each instance has a pointer associated with it that can be used to
		*  store anything it likes. This pointer is per-instance of the stream,
		*  so presumably it will change when calling duplicate(). This can be
		*  deallocated during the destroy() method.
		*/
		void *opaque;
	
		/**
		* \brief Read more data.
		*
		* Read (len) bytes from the interface, at the current i/o position, and
		*  store them in (buffer). The current i/o position should move ahead
		*  by the number of bytes successfully read.
		*
		* You don't have to implement this; set it to NULL if not implemented.
		*  This will only be used if the file is opened for reading. If set to
		*  NULL, a default implementation that immediately reports failure will
		*  be used.
		*
		*   \param io The i/o instance to read from.
		*   \param buf The buffer to store data into. It must be at least
		*                 (len) bytes long and can't be NULL.
		*   \param len The number of bytes to read from the interface.
		*  \return number of bytes read from file, 0 on EOF, -1 if complete
		*          failure.
		*/
		int64 (*read)(struct PHYSFS_Io *io, void *buf, uint64 len);
	
		/**
		* \brief Write more data.
		*
		* Write (len) bytes from (buffer) to the interface at the current i/o
		*  position. The current i/o position should move ahead by the number of
		*  bytes successfully written.
		*
		* You don't have to implement this; set it to NULL if not implemented.
		*  This will only be used if the file is opened for writing. If set to
		*  NULL, a default implementation that immediately reports failure will
		*  be used.
		*
		* You are allowed to buffer; a write can succeed here and then later
		*  fail when flushing. Note that PHYSFS_setBuffer() may be operating a
		*  level above your i/o, so you should usually not implement your
		*  own buffering routines.
		*
		*   \param io The i/o instance to write to.
		*   \param buffer The buffer to read data from. It must be at least
		*                 (len) bytes long and can't be NULL.
		*   \param len The number of bytes to read from (buffer).
		*  \return number of bytes written to file, -1 if complete failure.
		*/
		int64 (*write)(struct PHYSFS_Io *io, const void *buffer,
								uint64 len);
	
		/**
		* \brief Move i/o position to a given byte offset from start.
		*
		* This method moves the i/o position, so the next read/write will
		*  be of the byte at (offset) offset. Seeks past the end of file should
		*  be treated as an error condition.
		*
		*   \param io The i/o instance to seek.
		*   \param offset The new byte offset for the i/o position.
		*  \return non-zero on success, zero on error.
		*/
		int (*seek)(struct PHYSFS_Io *io, uint64 offset);
	
		/**
		* \brief Report current i/o position.
		*
		* Return bytes offset, or -1 if you aren't able to determine. A failure
		*  will almost certainly be fatal to further use of this stream, so you
		*  may not leave this unimplemented.
		*
		*   \param io The i/o instance to query.
		*  \return The current byte offset for the i/o position, -1 if unknown.
		*/
		int64 (*tell)(struct PHYSFS_Io *io);
	
		/**
		* \brief Determine size of the i/o instance's dataset.
		*
		* Return number of bytes available in the file, or -1 if you
		*  aren't able to determine. A failure will almost certainly be fatal
		*  to further use of this stream, so you may not leave this unimplemented.
		*
		*   \param io The i/o instance to query.
		*  \return Total size, in bytes, of the dataset.
		*/
		int64 (*length)(struct PHYSFS_Io *io);
	
		/**
		* \brief Duplicate this i/o instance.
		*
		* This needs to result in a full copy of this PHYSFS_Io, that can live
		*  completely independently. The copy needs to be able to perform all
		*  its operations without altering the original, including either object
		*  being destroyed separately (so, for example: they can't share a file
		*  handle; they each need their own).
		*
		* If you can't duplicate a handle, it's legal to return NULL, but you
		*  almost certainly need this functionality if you want to use this to
		*  PHYSFS_Io to back an archive.
		*
		*   \param io The i/o instance to duplicate.
		*  \return A new value for a stream's (opaque) field, or NULL on error.
		*/
		struct PHYSFS_Io *(*duplicate)(struct PHYSFS_Io *io);
	
		/**
		* \brief Flush resources to media, or wherever.
		*
		* This is the chance to report failure for writes that had claimed
		*  success earlier, but still had a chance to actually fail. This method
		*  can be NULL if flushing isn't necessary.
		*
		* This function may be called before destroy(), as it can report failure
		*  and destroy() can not. It may be called at other times, too.
		*
		*   \param io The i/o instance to flush.
		*  \return Zero on error, non-zero on success.
		*/
		int (*flush)(struct PHYSFS_Io *io);
	
		/**
		* \brief Cleanup and deallocate i/o instance.
		*
		* Free associated resources, including (opaque) if applicable.
		*
		* This function must always succeed: as such, it returns void. The
		*  system may call your flush() method before this. You may report
		*  failure there if necessary. This method may still be called if
		*  flush() fails, in which case you'll have to abandon unflushed data
		*  and other failing conditions and clean up.
		*
		* Once this method is called for a given instance, the system will assume
		*  it is unsafe to touch that instance again and will discard any
		*  references to it.
		*
		*   \param s The i/o instance to destroy.
		*/
		void (*destroy)(struct PHYSFS_Io *io);
	} PHYSFS_Io;
	
	
	/**
	* \fn int PHYSFS_mountIo(PHYSFS_Io *io, const char *newDir, const char *mountPoint, int appendToPath)
	* \brief Add an archive, built on a PHYSFS_Io, to the search path.
	*
	* \warning Unless you have some special, low-level need, you should be using
	*          PHYSFS_mount() instead of this.
	*
	* This function operates just like PHYSFS_mount(), but takes a PHYSFS_Io
	*  instead of a pathname. Behind the scenes, PHYSFS_mount() calls this
	*  function with a physical-filesystem-based PHYSFS_Io.
	*
	* (newDir) must be a unique string to identify this archive. It is used
	*  to optimize archiver selection (if you name it XXXXX.zip, we might try
	*  the ZIP archiver first, for example, or directly choose an archiver that
	*  can only trust the data is valid by filename extension). It doesn't
	*  need to refer to a real file at all. If the filename extension isn't
	*  helpful, the system will try every archiver until one works or none
	*  of them do. This filename must be unique, as the system won't allow you
	*  to have two archives with the same name.
	*
	* (io) must remain until the archive is unmounted. When the archive is
	*  unmounted, the system will call (io)->destroy(io), which will give you
	*  a chance to free your resources.
	*
	* If this function fails, (io)->destroy(io) is not called.
	*
	*   \param io i/o instance for archive to add to the path.
	*   \param newDir Filename that can represent this stream.
	*   \param mountPoint Location in the interpolated tree that this archive
	*                     will be "mounted", in platform-independent notation.
	*                     NULL or "" is equivalent to "/".
	*   \param appendToPath nonzero to append to search path, zero to prepend.
	*  \return nonzero if added to path, zero on failure (bogus archive, stream
	*                   i/o issue, etc). Use PHYSFS_getLastErrorCode() to obtain
	*                   the specific error.
	*
	* \sa PHYSFS_unmount
	* \sa PHYSFS_getSearchPath
	* \sa PHYSFS_getMountPoint
	*/
	public bool PHYSFS_mountIo(PHYSFS_Io *io, const char *newDir,
									const char *mountPoint, int appendToPath);
	
	
	/**
	* \fn int PHYSFS_mountMemory(const void *buf, uint64 len, void (*del)(void *), const char *newDir, const char *mountPoint, int appendToPath)
	* \brief Add an archive, contained in a memory buffer, to the search path.
	*
	* \warning Unless you have some special, low-level need, you should be using
	*          PHYSFS_mount() instead of this.
	*
	* This function operates just like PHYSFS_mount(), but takes a memory buffer
	*  instead of a pathname. This buffer contains all the data of the archive,
	*  and is used instead of a real file in the physical filesystem.
	*
	* (newDir) must be a unique string to identify this archive. It is used
	*  to optimize archiver selection (if you name it XXXXX.zip, we might try
	*  the ZIP archiver first, for example, or directly choose an archiver that
	*  can only trust the data is valid by filename extension). It doesn't
	*  need to refer to a real file at all. If the filename extension isn't
	*  helpful, the system will try every archiver until one works or none
	*  of them do. This filename must be unique, as the system won't allow you
	*  to have two archives with the same name.
	*
	* (ptr) must remain until the archive is unmounted. When the archive is
	*  unmounted, the system will call (del)(ptr), which will notify you that
	*  the system is done with the buffer, and give you a chance to free your
	*  resources. (del) can be NULL, in which case the system will make no
	*  attempt to free the buffer.
	*
	* If this function fails, (del) is not called.
	*
	*   \param buf Address of the memory buffer containing the archive data.
	*   \param len Size of memory buffer, in bytes.
	*   \param del A callback that triggers upon unmount. Can be NULL.
	*   \param newDir Filename that can represent this stream.
	*   \param mountPoint Location in the interpolated tree that this archive
	*                     will be "mounted", in platform-independent notation.
	*                     NULL or "" is equivalent to "/".
	*   \param appendToPath nonzero to append to search path, zero to prepend.
	*  \return nonzero if added to path, zero on failure (bogus archive, etc).
	*          Use PHYSFS_getLastErrorCode() to obtain the specific error.
	*
	* \sa PHYSFS_unmount
	* \sa PHYSFS_getSearchPath
	* \sa PHYSFS_getMountPoint
	*/
	public bool PHYSFS_mountMemory(const void *buf, uint64 len,
										void (*del)(void *), const char *newDir,
										const char *mountPoint, int appendToPath);
	
	
	/**
	* \fn int PHYSFS_mountHandle(File* file, const char *newDir, const char *mountPoint, int appendToPath)
	* \brief Add an archive, contained in a File handle, to the search path.
	*
	* \warning Unless you have some special, low-level need, you should be using
	*          PHYSFS_mount() instead of this.
	*
	* \warning Archives-in-archives may be very slow! While a File can
	*          seek even when the data is compressed, it may do so by rewinding
	*          to the start and decompressing everything before the seek point.
	*          Normal archive usage may do a lot of seeking behind the scenes.
	*          As such, you might find normal archive usage extremely painful
	*          if mounted this way. Plan accordingly: if you, say, have a
	*          self-extracting .zip file, and want to mount something in it,
	*          compress the contents of the inner archive and make sure the outer
	*          .zip file doesn't compress the inner archive too.
	*
	* This function operates just like PHYSFS_mount(), but takes a File
	*  handle instead of a pathname. This handle contains all the data of the
	*  archive, and is used instead of a real file in the physical filesystem.
	*  The File may be backed by a real file in the physical filesystem,
	*  but isn't necessarily. The most popular use for this is likely to mount
	*  archives stored inside other archives.
	*
	* (newDir) must be a unique string to identify this archive. It is used
	*  to optimize archiver selection (if you name it XXXXX.zip, we might try
	*  the ZIP archiver first, for example, or directly choose an archiver that
	*  can only trust the data is valid by filename extension). It doesn't
	*  need to refer to a real file at all. If the filename extension isn't
	*  helpful, the system will try every archiver until one works or none
	*  of them do. This filename must be unique, as the system won't allow you
	*  to have two archives with the same name.
	*
	* (file) must remain until the archive is unmounted. When the archive is
	*  unmounted, the system will call PHYSFS_close(file). If you need this
	*  handle to survive, you will have to wrap this in a PHYSFS_Io and use
	*  PHYSFS_mountIo() instead.
	*
	* If this function fails, PHYSFS_close(file) is not called.
	*
	*   \param file The File handle containing archive data.
	*   \param newDir Filename that can represent this stream.
	*   \param mountPoint Location in the interpolated tree that this archive
	*                     will be "mounted", in platform-independent notation.
	*                     NULL or "" is equivalent to "/".
	*   \param appendToPath nonzero to append to search path, zero to prepend.
	*  \return nonzero if added to path, zero on failure (bogus archive, etc).
	*          Use PHYSFS_getLastErrorCode() to obtain the specific error.
	*
	* \sa PHYSFS_unmount
	* \sa PHYSFS_getSearchPath
	* \sa PHYSFS_getMountPoint
	*/
	public bool PHYSFS_mountHandle(File* file, const char *newDir,
										const char *mountPoint, int appendToPath);
	
	
	/**
	* \enum PHYSFS_ErrorCode
	* \brief Values that represent specific causes of failure.
	*
	* Most of the time, you should only concern yourself with whether a given
	*  operation failed or not, but there may be occasions where you plan to
	*  handle a specific failure case gracefully, so we provide specific error
	*  codes.
	*
	* Most of these errors are a little vague, and most aren't things you can
	*  fix...if there's a permission error, for example, all you can really do
	*  is pass that information on to the user and let them figure out how to
	*  handle it. In most these cases, your program should only care that it
	*  failed to accomplish its goals, and not care specifically why.
	*
	* \sa PHYSFS_getLastErrorCode
	* \sa PHYSFS_getErrorByCode
	*/
	typedef enum PHYSFS_ErrorCode
	{
		PHYSFS_ERR_OK,               /**< Success; no error.                    */
		PHYSFS_ERR_OTHER_ERROR,      /**< Error not otherwise covered here.     */
		PHYSFS_ERR_OUT_OF_MEMORY,    /**< Memory allocation failed.             */
		PHYSFS_ERR_NOT_INITIALIZED,  /**< PhysicsFS is not initialized.         */
		PHYSFS_ERR_IS_INITIALIZED,   /**< PhysicsFS is already initialized.     */
		PHYSFS_ERR_ARGV0_IS_NULL,    /**< Needed argv[0], but it is NULL.       */
		PHYSFS_ERR_UNSUPPORTED,      /**< Operation or feature unsupported.     */
		PHYSFS_ERR_PAST_EOF,         /**< Attempted to access past end of file. */
		PHYSFS_ERR_FILES_STILL_OPEN, /**< Files still open.                     */
		PHYSFS_ERR_INVALID_ARGUMENT, /**< Bad parameter passed to an function.  */
		PHYSFS_ERR_NOT_MOUNTED,      /**< Requested archive/dir not mounted.    */
		PHYSFS_ERR_NOT_FOUND,        /**< File (or whatever) not found.         */
		PHYSFS_ERR_SYMLINK_FORBIDDEN,/**< Symlink seen when not permitted.      */
		PHYSFS_ERR_NO_WRITE_DIR,     /**< No write dir has been specified.      */
		PHYSFS_ERR_OPEN_FOR_READING, /**< Wrote to a file opened for reading.   */
		PHYSFS_ERR_OPEN_FOR_WRITING, /**< Read from a file opened for writing.  */
		PHYSFS_ERR_NOT_A_FILE,       /**< Needed a file, got a directory (etc). */
		PHYSFS_ERR_READ_ONLY,        /**< Wrote to a read-only filesystem.      */
		PHYSFS_ERR_CORRUPT,          /**< Corrupted data encountered.           */
		PHYSFS_ERR_SYMLINK_LOOP,     /**< Infinite symbolic link loop.          */
		PHYSFS_ERR_IO,               /**< i/o error (hardware failure, etc).    */
		PHYSFS_ERR_PERMISSION,       /**< Permission denied.                    */
		PHYSFS_ERR_NO_SPACE,         /**< No space (disk full, over quota, etc) */
		PHYSFS_ERR_BAD_FILENAME,     /**< Filename is bogus/insecure.           */
		PHYSFS_ERR_BUSY,             /**< Tried to modify a file the OS needs.  */
		PHYSFS_ERR_DIR_NOT_EMPTY,    /**< Tried to delete dir with files in it. */
		PHYSFS_ERR_OS_ERROR,         /**< Unspecified OS-level error.           */
		PHYSFS_ERR_DUPLICATE,        /**< Duplicate entry.                      */
		PHYSFS_ERR_BAD_PASSWORD,     /**< Bad password.                         */
		PHYSFS_ERR_APP_CALLBACK      /**< Application callback reported error.  */
	} PHYSFS_ErrorCode;
	
	
	/**
	* \fn PHYSFS_ErrorCode PHYSFS_getLastErrorCode()
	* \brief Get machine-readable error information.
	*
	* Get the last PhysicsFS error message as an integer value. This will return
	*  PHYSFS_ERR_OK if there's been no error since the last call to this
	*  function. Each thread has a unique error state associated with it, but
	*  each time a new error message is set, it will overwrite the previous one
	*  associated with that thread. It is safe to call this function at anytime,
	*  even before PHYSFS_init().
	*
	* PHYSFS_getLastError() and PHYSFS_getLastErrorCode() both reset the same
	*  thread-specific error state. Calling one will wipe out the other's
	*  data. If you need both, call PHYSFS_getLastErrorCode(), then pass that
	*  value to PHYSFS_getErrorByCode().
	*
	* Generally, applications should only concern themselves with whether a
	*  given function failed; however, if you require more specifics, you can
	*  try this function to glean information, if there's some specific problem
	*  you're expecting and plan to handle. But with most things that involve
	*  file systems, the best course of action is usually to give up, report the
	*  problem to the user, and let them figure out what should be done about it.
	*  For that, you might prefer PHYSFS_getErrorByCode() instead.
	*
	*   \return Enumeration value that represents last reported error.
	*
	* \sa PHYSFS_getErrorByCode
	*/
	public PHYSFS_ErrorCode PHYSFS_getLastErrorCode();
	
	
	/**
	* \fn const char *PHYSFS_getErrorByCode(PHYSFS_ErrorCode code)
	* \brief Get human-readable description string for a given error code.
	*
	* Get a static string, in UTF-8 format, that represents an English
	*  description of a given error code.
	*
	* This string is guaranteed to never change (although we may add new strings
	*  for new error codes in later versions of PhysicsFS), so you can use it
	*  for keying a localization dictionary.
	*
	* It is safe to call this function at anytime, even before PHYSFS_init().
	*
	* These strings are meant to be passed on directly to the user.
	*  Generally, applications should only concern themselves with whether a
	*  given function failed, but not care about the specifics much.
	*
	* Do not attempt to free the returned strings; they are read-only and you
	*  don't own their memory pages.
	*
	*   \param code Error code to convert to a string.
	*   \return READ ONLY string of requested error message, NULL if this
	*           is not a valid PhysicsFS error code. Always check for NULL if
	*           you might be looking up an error code that didn't exist in an
	*           earlier version of PhysicsFS.
	*
	* \sa PHYSFS_getLastErrorCode
	*/
	public const char *PHYSFS_getErrorByCode(PHYSFS_ErrorCode code);
	
	/**
	* \fn void PHYSFS_setErrorCode(PHYSFS_ErrorCode code)
	* \brief Set the current thread's error code.
	*
	* This lets you set the value that will be returned by the next call to
	*  PHYSFS_getLastErrorCode(). This will replace any existing error code,
	*  whether set by your application or internally by PhysicsFS.
	*
	* Error codes are stored per-thread; what you set here will not be
	*  accessible to another thread.
	*
	* Any call into PhysicsFS may change the current error code, so any code you
	*  set here is somewhat fragile, and thus you shouldn't build any serious
	*  error reporting framework on this function. The primary goal of this
	*  function is to allow PHYSFS_Io implementations to set the error state,
	*  which generally will be passed back to your application when PhysicsFS
	*  makes a PHYSFS_Io call that fails internally.
	*
	* This function doesn't care if the error code is a value known to PhysicsFS
	*  or not (but PHYSFS_getErrorByCode() will return NULL for unknown values).
	*  The value will be reported unmolested by PHYSFS_getLastErrorCode().
	*
	*   \param code Error code to become the current thread's new error state.
	*
	* \sa PHYSFS_getLastErrorCode
	* \sa PHYSFS_getErrorByCode
	*/
	public void PHYSFS_setErrorCode(PHYSFS_ErrorCode code);
	
	
	/**
	* \fn const char *PHYSFS_getPrefDir(const char *org, const char *app)
	* \brief Get the user-and-app-specific path where files can be written.
	*
	* Helper function.
	*
	* Get the "pref dir". This is meant to be where users can write personal
	*  files (preferences and save games, etc) that are specific to your
	*  application. This directory is unique per user, per application.
	*
	* This function will decide the appropriate location in the native filesystem,
	*  create the directory if necessary, and return a string in
	*  platform-dependent notation, suitable for passing to PHYSFS_setWriteDir().
	*
	* On Windows, this might look like:
	*  "C:\\Users\\bob\\AppData\\Roaming\\My Company\\My Program Name"
	*
	* On Linux, this might look like:
	*  "/home/bob/.local/share/My Program Name"
	*
	* On Mac OS X, this might look like:
	*  "/Users/bob/Library/Application Support/My Program Name"
	*
	* (etc.)
	*
	* You should probably use the pref dir for your write dir, and also put it
	*  near the beginning of your search path. Older versions of PhysicsFS
	*  offered only PHYSFS_getUserDir() and left you to figure out where the
	*  files should go under that tree. This finds the correct location
	*  for whatever platform, which not only changes between operating systems,
	*  but also versions of the same operating system.
	*
	* You specify the name of your organization (if it's not a real organization,
	*  your name or an Internet domain you own might do) and the name of your
	*  application. These should be proper names.
	*
	* Both the (org) and (app) strings may become part of a directory name, so
	*  please follow these rules:
	*
	*    - Try to use the same org string (including case-sensitivity) for
	*      all your applications that use this function.
	*    - Always use a unique app string for each one, and make sure it never
	*      changes for an app once you've decided on it.
	*    - Unicode characters are legal, as long as it's UTF-8 encoded, but...
	*    - ...only use letters, numbers, and spaces. Avoid punctuation like
	*      "Game Name 2: Bad Guy's Revenge!" ... "Game Name 2" is sufficient.
	*
	* The pointer returned by this function remains valid until you call this
	*  function again, or call PHYSFS_deinit(). This is not necessarily a fast
	*  call, though, so you should call this once at startup and copy the string
	*  if you need it.
	*
	* You should assume the path returned by this function is the only safe
	*  place to write files (and that PHYSFS_getUserDir() and PHYSFS_getBaseDir(),
	*  while they might be writable, or even parents of the returned path, aren't
	*  where you should be writing things).
	*
	*   \param org The name of your organization.
	*   \param app The name of your application.
	*  \return READ ONLY string of user dir in platform-dependent notation. NULL
	*          if there's a problem (creating directory failed, etc).
	*
	* \sa PHYSFS_getBaseDir
	* \sa PHYSFS_getUserDir
	*/
	public const char *PHYSFS_getPrefDir(const char *org, const char *app);
	
	
	/**
	* \struct PHYSFS_Archiver
	* \brief Abstract interface to provide support for user-defined archives.
	*
	* \warning This is advanced, hardcore stuff. You don't need this unless you
	*          really know what you're doing. Most apps will not need this.
	*
	* Historically, PhysicsFS provided a means to mount various archive file
	*  formats, and physical directories in the native filesystem. However,
	*  applications have been limited to the file formats provided by the
	*  library. This interface allows an application to provide their own
	*  archive file types.
	*
	* Conceptually, a PHYSFS_Archiver provides directory entries, while
	*  PHYSFS_Io provides data streams for those directory entries. The most
	*  obvious use of PHYSFS_Archiver is to provide support for an archive
	*  file type that isn't provided by PhysicsFS directly: perhaps some
	*  proprietary format that only your application needs to understand.
	*
	* Internally, all the built-in archive support uses this interface, so the
	*  best examples for building a PHYSFS_Archiver is the source code to
	*  PhysicsFS itself.
	*
	* An archiver is added to the system with PHYSFS_registerArchiver(), and then
	*  it will be available for use automatically with PHYSFS_mount(); if a
	*  given archive can be handled with your archiver, it will be given control
	*  as appropriate.
	*
	* These methods deal with dir handles. You have one instance of your
	*  archiver, and it generates a unique, opaque handle for each opened
	*  archive in its openArchive() method. Since the lifetime of an Archiver
	*  (not an archive) is generally the entire lifetime of the process, and it's
	*  assumed to be a singleton, we do not provide any instance data for the
	*  archiver itself; the app can just use some static variables if necessary.
	*
	* Symlinks should always be followed (except in stat()); PhysicsFS will
	*  use the stat() method to check for symlinks and make a judgement on
	*  whether to continue to call other methods based on that.
	*
	* Archivers, when necessary, should set the PhysicsFS error state with
	*  PHYSFS_setErrorCode() before returning. PhysicsFS will pass these errors
	*  back to the application unmolested in most cases.
	*
	* Thread safety: PHYSFS_Archiver implementations are not guaranteed to be
	*  thread safe in themselves. PhysicsFS provides thread safety when it calls
	*  into a given archiver inside the library, but it does not promise that
	*  using the same File from two threads at once is thread-safe; as
	*  such, your PHYSFS_Archiver can assume that locking is handled for you
	*  so long as the PHYSFS_Io you return from PHYSFS_open* doesn't change any
	*  of your Archiver state, as the PHYSFS_Io won't be as aggressively
	*  protected.
	*
	* \sa PHYSFS_registerArchiver
	* \sa PHYSFS_deregisterArchiver
	* \sa PHYSFS_supportedArchiveTypes
	*/
	typedef struct PHYSFS_Archiver
	{
		/**
		* \brief Binary compatibility information.
		*
		* This must be set to zero at this time. Future versions of this
		*  struct will increment this field, so we know what a given
		*  implementation supports. We'll presumably keep supporting older
		*  versions as we offer new features, though.
		*/
		uint32 version;
	
		/**
		* \brief Basic info about this archiver.
		*
		* This is used to identify your archive, and is returned in
		*  PHYSFS_supportedArchiveTypes().
		*/
		PHYSFS_ArchiveInfo info;
	
		/**
		* \brief Open an archive provided by (io).
		*
		* This is where resources are allocated and data is parsed when mounting
		*  an archive.
		* (name) is a filename associated with (io), but doesn't necessarily
		*  map to anything, let alone a real filename. This possibly-
		*  meaningless name is in platform-dependent notation.
		* (forWrite) is non-zero if this is to be used for
		*  the write directory, and zero if this is to be used for an
		*  element of the search path.
		* (claimed) should be set to 1 if this is definitely an archive your
		*  archiver implementation can handle, even if it fails. We use to
		*  decide if we should stop trying other archivers if you fail to open
		*  it. For example: the .zip archiver will set this to 1 for something
		*  that's got a .zip file signature, even if it failed because the file
		*  was also truncated. No sense in trying other archivers here, we
		*  already tried to handle it with the appropriate implementation!.
		* Return NULL on failure and set (claimed) appropriately. If no archiver
		*  opened the archive or set (claimed), PHYSFS_mount() will report
		*  PHYSFS_ERR_UNSUPPORTED. Otherwise, it will report the error from the
		*  archiver that claimed the data through (claimed).
		* Return non-NULL on success. The pointer returned will be
		*  passed as the "opaque" parameter for later calls.
		*/
		void *(*openArchive)(PHYSFS_Io *io, const char *name,
							int forWrite, int *claimed);
	
		/**
		* \brief List all files in (dirname).
		*
		* Each file is passed to (cb), where a copy is made if appropriate, so
		*  you can dispose of it upon return from the callback. (dirname) is in
		*  platform-independent notation.
		* If you have a failure, call PHYSFS_SetErrorCode() with whatever code
		*  seem appropriate and return PHYSFS_ENUM_ERROR.
		* If the callback returns PHYSFS_ENUM_ERROR, please call
		*  PHYSFS_SetErrorCode(PHYSFS_ERR_APP_CALLBACK) and then return
		*  PHYSFS_ENUM_ERROR as well. Don't call the callback again in any
		*  circumstances.
		* If the callback returns PHYSFS_ENUM_STOP, stop enumerating and return
		*  PHYSFS_ENUM_STOP as well. Don't call the callback again in any
		*  circumstances. Don't set an error code in this case.
		* Callbacks are only supposed to return a value from
		*  PHYSFS_EnumerateCallbackResult. Any other result has undefined
		*  behavior.
		* As long as the callback returned PHYSFS_ENUM_OK and you haven't
		*  experienced any errors of your own, keep enumerating until you're done
		*  and then return PHYSFS_ENUM_OK without setting an error code.
		*
		* \warning PHYSFS_enumerate returns zero or non-zero (success or failure),
		*          so be aware this function pointer returns different values!
		*/
		PHYSFS_EnumerateCallbackResult (*enumerate)(void *opaque,
						const char *dirname, PHYSFS_EnumerateCallback cb,
						const char *origdir, void *callbackdata);
	
		/**
		* \brief Open a file in this archive for reading.
		*
		* This filename, (fnm), is in platform-independent notation.
		* Fail if the file does not exist.
		* Returns NULL on failure, and calls PHYSFS_setErrorCode().
		*  Returns non-NULL on success. The pointer returned will be
		*  passed as the "opaque" parameter for later file calls.
		*/
		PHYSFS_Io *(*openRead)(void *opaque, const char *fnm);
	
		/**
		* \brief Open a file in this archive for writing.
		*
		* If the file does not exist, it should be created. If it exists,
		*  it should be truncated to zero bytes. The writing offset should
		*  be the start of the file.
		* If the archive is read-only, this operation should fail.
		* This filename is in platform-independent notation.
		* Returns NULL on failure, and calls PHYSFS_setErrorCode().
		*  Returns non-NULL on success. The pointer returned will be
		*  passed as the "opaque" parameter for later file calls.
		*/
		PHYSFS_Io *(*openWrite)(void *opaque, const char *filename);
	
		/**
		* \brief Open a file in this archive for appending.
		*
		* If the file does not exist, it should be created. The writing
		*  offset should be the end of the file.
		* If the archive is read-only, this operation should fail.
		* This filename is in platform-independent notation.
		* Returns NULL on failure, and calls PHYSFS_setErrorCode().
		*  Returns non-NULL on success. The pointer returned will be
		*  passed as the "opaque" parameter for later file calls.
		*/
		PHYSFS_Io *(*openAppend)(void *opaque, const char *filename);
	
		/**
		* \brief Delete a file or directory in the archive.
		*
		* This same call is used for both files and directories; there is not a
		*  separate rmdir() call. Directories are only meant to be removed if
		*  they are empty.
		* If the archive is read-only, this operation should fail.
		*
		* Return non-zero on success, zero on failure.
		* This filename is in platform-independent notation.
		* On failure, call PHYSFS_setErrorCode().
		*/
		int (*remove)(void *opaque, const char *filename);
	
		/**
		* \brief Create a directory in the archive.
		*
		* If the application is trying to make multiple dirs, PhysicsFS
		*  will split them up into multiple calls before passing them to
		*  your driver.
		* If the archive is read-only, this operation should fail.
		* Return non-zero on success, zero on failure.
		*  This filename is in platform-independent notation.
		* On failure, call PHYSFS_setErrorCode().
		*/
		int (*mkdir)(void *opaque, const char *filename);
	
		/**
		* \brief Obtain basic file metadata.
		*
		* On success, fill in all the fields in (stat), using
		*  reasonable defaults for fields that apply to your archive.
		*
		* Returns non-zero on success, zero on failure.
		* This filename is in platform-independent notation.
		* On failure, call PHYSFS_setErrorCode().
		*/
		int (*stat)(void *opaque, const char *fn, PHYSFS_Stat *stat);
	
		/**
		* \brief Destruct a previously-opened archive.
		*
		* Close this archive, and free any associated memory,
		*  including the original PHYSFS_Io and (opaque) itself, if
		*  applicable. Implementation can assume that it won't be called if
		*  there are still files open from this archive.
		*/
		void (*closeArchive)(void *opaque);
	} PHYSFS_Archiver;
	
	/**
	* \fn int PHYSFS_registerArchiver(const PHYSFS_Archiver *archiver)
	* \brief Add a new archiver to the system.
	*
	* \warning This is advanced, hardcore stuff. You don't need this unless you
	*          really know what you're doing. Most apps will not need this.
	*
	* If you want to provide your own archiver (for example, a custom archive
	*  file format, or some virtual thing you want to make look like a filesystem
	*  that you can access through the usual PhysicsFS APIs), this is where you
	*  start. Once an archiver is successfully registered, then you can use
	*  PHYSFS_mount() to add archives that your archiver supports to the
	*  search path, or perhaps use it as the write dir. Internally, PhysicsFS
	*  uses this function to register its own built-in archivers, like .zip
	*  support, etc.
	*
	* You may not have two archivers that handle the same extension. If you are
	*  going to have a clash, you can deregister the other archiver (including
	*  built-in ones) with PHYSFS_deregisterArchiver().
	*
	* The data in (archiver) is copied; you may free this pointer when this
	*  function returns.
	*
	* Once this function returns successfully, PhysicsFS will be able to support
	*  archives of this type until you deregister the archiver again.
	*
	*   \param archiver The archiver to register.
	*  \return Zero on error, non-zero on success.
	*
	* \sa PHYSFS_Archiver
	* \sa PHYSFS_deregisterArchiver
	*/
	public bool PHYSFS_registerArchiver(const PHYSFS_Archiver *archiver);
	
	/**
	* \fn int PHYSFS_deregisterArchiver(const char *ext)
	* \brief Remove an archiver from the system.
	*
	* If for some reason, you only need your previously-registered archiver to
	*  live for a portion of your app's lifetime, you can remove it from the
	*  system once you're done with it through this function.
	*
	* This fails if there are any archives still open that use this archiver.
	*
	* This function can also remove internally-supplied archivers, like .zip
	*  support or whatnot. This could be useful in some situations, like
	*  disabling support for them outright or overriding them with your own
	*  implementation. Once an internal archiver is disabled like this,
	*  PhysicsFS provides no mechanism to recover them, short of calling
	*  PHYSFS_deinit() and PHYSFS_init() again.
	*
	* PHYSFS_deinit() will automatically deregister all archivers, so you don't
	*  need to explicitly deregister yours if you otherwise shut down cleanly.
	*
	*   \param ext Filename extension that the archiver handles.
	*  \return Zero on error, non-zero on success.
	*
	* \sa PHYSFS_Archiver
	* \sa PHYSFS_registerArchiver
	*/
	public bool PHYSFS_deregisterArchiver(const char *ext);
}
