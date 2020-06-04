pipeline {
    agent any
	triggers{
		pollSCM('* * * * *')
	}
    stages {
            
            stage("Compile") {
                                steps {
                                        sh 'mvn compile'
                                }
            }
            stage("Unit Test") {
                                steps {
                                        sh 'mvn test'
					publishHTML([allowMissing: false,
						     alwaysLinkToLastBuild: false,
						     keepAll: false,
						     reportDir: 'target/site/jacoco/',
						     reportFiles: 'index.html',
						     reportName: 'Code Coverage Report',
						     reportTitles: ''])
				}
	    }
	    stage ("Code coverage"){
		    steps{
			    sh "mvn verify"
		    }
	    }
	    stage ("Build")
	    {
		    steps{
			    sh "mvn package -Dmaven.test.skip=true"
		    }
	    }
	    stage("Docker Build"){
		    steps{sh "docker build -t localhost:5000/calculator:1 ."}
	    }
	    stage("Docker Ship")
	    {
		    steps{sh "docker push localhost:5000/calculator:1"}
	    }
	    stage("Docker Run")
	    {
		    //steps{sh "docker run -dit --name calculator -p 9876:8080 --restart always localhost:5000/calculator:1"}
		    echo 'test'
	    }
	    stage("Acceptance testing")
	    {
		    steps{
			    //sleep 60
			   // sh "chmod +x acceptance_test.sh && ./acceptance_test.sh"
			    echo 'test'
		    }
	    }

			 
							
}
	post{
		success{
			echo "Completed Pipeline: ${currentBuild.fullDisplayName}"
		}
		failure{
			echo "The pipeline: ${currentBuild.fullDisplayName} failed"
			sh "docker stop calculator"

		}
	}
			
}
