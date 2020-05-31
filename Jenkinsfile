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
