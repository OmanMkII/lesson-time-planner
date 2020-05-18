var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

function printFile(file) {
  console.log(file);
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function readTextFile(file, funct) {
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = async () => {
        if(rawFile.readyState === 4) {
            if(rawFile.status === 200 || rawFile.status == 0) {
                await funct(rawFile.responseText);
            }
        }
    }
    rawFile.send(null);
}

readTextFile("file:///mnt/b/Projects/Other/lesson-time-planner/backend/sql/database.sql", printFile);
