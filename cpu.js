//echo the info of cpu
const os = require('os');

var sysinfo = {
    arch: 0,
    cpu: 0,
    tm: 'Not Certained'
}

let cpuinfo = os.cpus();


sysinfo.arch = os.arch();
sysinfo.cpu = cpuinfo.length;
sysinfo.tm = cpuinfo[0].model;

console.log(cpuinfo[0].model);

module.exports =  sysinfo;