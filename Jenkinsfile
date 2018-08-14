node('docker') {
  def appName = 'myflask'
  def imageTag = "xomodo/${appName}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"

  stage('Clone repository') {
        checkout scm
  }

  stage ('Build image') {
     sh("docker build -t ${imageTag} .")
  } 

  stage ('Push image to registry') {
    sh("docker push ${imageTag}")
  }

  stage ('Deploy") {
	  switch (env.BRANCH_NAME) {
	    case "staging":
		sh("docker run -d --name=staging_${appName} -p 5001:5000 ${imageTag}")
		input 'looks good ?'
		sh("docker rm -f staging_${appName}")
		break
	    case "master":
		input 'are you sure ?'
		sh("docker rm -f production_${appName}")
		sh("docker run -d --name=production_${appName} -p 5000:5000 ${imageTag}")
		break
	    default:
		sh("docker ps")
	}
  }
}
