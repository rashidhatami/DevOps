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
					publishHTML (target: [
					reportDir: 'target/site/jacoco',
					reportFiles: 'index.html',
					reportName: "Code coverage Report"
					])
                                }
            }
		stage("Code Coverage: 50%") {
				                steps {
							sh 'mvn verify'
					
				                }
			    }
		stage("Package") {
			steps {
				sh "mvn package"
			}
		}
		stage("Build (Docker build)") {
			steps {
				sh "docker build -t localhost:5000/calculator ."
			}
		}

		stage("Ship (Docker push)") {
			steps {
				sh "docker push localhost:5000/calculator"
			}
		}
		stage("Update version"){
		      steps{
			    echo 'Update version'
			    }
		}
		stage("Run (Deploy to staging)") {
			steps {
				sh "docker run -d --rm -p 8765:8080 --name calculator localhost:5000/calculator"
			}
		}
		stage("User Acceptance test") {
			steps {
				sleep 60
				sh "chmod +x acceptance_test.sh && ./acceptance_test.sh"
				}
		}
		stage("Performance test"){
		      steps{
			    echo 'Performance testing'
			    }
		}
		stage("Release"){
		      steps{
			    echo 'Release'
			    }
		}
		stage("Smok test"){
		      steps{
			    echo 'Smok test'
			    }
		}		
}
		post {
			always {
				sh "docker stop calculator"
				}
		}	
}
