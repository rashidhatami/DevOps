pipeline {
    agent any
		triggers {
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
	    stage ("Build")
	    {
		    steps{
			    sh "mvn package -Dmaven.test.skip=true"
		    }
	    }
							
}
			
}
