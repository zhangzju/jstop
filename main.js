const electron = require('electron')
const {app} = require('electron')
const path = require('path')
const os = require('os')

const {BrowserWindow} = electron

let mainWindow

function createWindow (){
  mainWindow = new BrowserWindow({width: 800, height: 600})
  mainWindow.loadURL('file://' + __dirname + '/index.html')
  mainWindow.webContents.openDevTools()
  mainWindow.on('closed', ()=>{
    mainWindow = null
  })
}

app.on('ready', createWindow)
app.on('ready', function (){
  console.log(os.cpus().length)
  for (let cpu of os.cpus()){
    // console.log(cpu.model);
  }
})

app.on('window-all-closed', () => {
  if(process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  if (mainWindow === null) {
    createWindow()
  }
})
