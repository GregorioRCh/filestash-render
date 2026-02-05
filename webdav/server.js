const { v2 } = require('webdav-server');
const server = new v2.WebDAVServer({
    port: 1900,
    httpAuthentication: new v2.HTTPBasicAuthentication('admin', 'AdminFiles'),
    privilegeManager: new v2.SimplePathPrivilegeManager()
});

server.setFileSystem('/',
    new v2.PhysicalFileSystem('/data'),
    (success) => {
        if (!success) console.error("Error mounting /data");
    }
);

server.start(() => console.log("WebDAV running on port 1900"));
