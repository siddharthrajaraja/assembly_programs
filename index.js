var express =require('express')
var fs =require('fs')
const path=require('path');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });


const app=express()


app.set('view engine','ejs');
app.use('/assets',express.static('assets'));


app.get('/get',(req,res)=>{
    res.render('select')
})

app.post('/submit',urlencodedParser,(req,res)=>{
    console.log(req.body)
    var extension='.txt';
    if(req.body.direc=="MP") extension='.asm' 
    var pathname=__dirname+'/experiments/'+req.body.direc+"/"+req.body.fname+extension

    const lineByLine = require('n-readlines');
const liner = new lineByLine(pathname);
 
let line;
let lineNumber = 0;

var output=[]
 
while (line = liner.next()) {
            output.push(line.toString('ascii'))
}
 
    res.render('output',{data:output})
console.log('end of line reached');

    /*fs.readFile(__dirname+'/experiments/'+req.body.direc+"/"+req.body.fname+'.txt','utf8',(err,data)=>{
        if(err) throw err;
    res.send(data)

    })*/
});


app.listen( process.env.PORT || 1234)
