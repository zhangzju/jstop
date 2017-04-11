//echo the info of cpu
const os = require('os');

var sysinfo = {
    arch: 0,
    cpu: 0
}
sysinfo.arch = os.arch();
// console.log(sysinfo);

module.exports =  sysinfo;