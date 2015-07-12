var {
  generateProject
} = require('diy-build')

var path = require('path')

generateProject(_ => {
   
  _.collectSeq("all", _ => {
	  _.cmd("git-hist history.md")
	  _.cmd("cat README.in.md history.md > README.md")
  })
})
