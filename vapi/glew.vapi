/**
 * This VAPI is based on GLEW 2.0
 * (GLenum => uint, GLubyte => uint8, GLboolean => uchar)
 */
[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="GL/glew.h")]
namespace GLEW {
	public uint glewInit ();
	public uchar glewIsSupported (char *name);

	public uchar glewExperimental;
	public uchar glewGetExtension (char *name);
	public uint8 *glewGetErrorString (uint error);
	public uint8 *glewGetString (uint name);

	/* ===== START GLEW_MX ===== */

	[SimpleType]
	public struct GLEWContext {}

	public uint8 glewContextInit (GLEWContext *ctx);
	public uchar glewContextIsSupported (GLEWContext *ctx, char *name);

	/* ===== END GLEW_MX ===== */
}