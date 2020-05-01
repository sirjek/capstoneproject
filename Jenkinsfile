pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          app = docker.build(dockerImage)
        }

      }
    }

    stage('Push Docker Image') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
        }

<<<<<<< HEAD
		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}

		stage('Build Docker Image') {
            		steps {
                		script {
                    			app = docker.build(dockerImage)
                    			}
            		}
||||||| merged common ancestors
		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}

		stage('Build Docker Image') {
            		steps {
                		script {
                    			app = docker.build(dockerImage)
                    			}
            		}
=======
      }
    }
>>>>>>> 686be38dda73aaf17a9f0c0bb06e8f11ad1e2c7e

    stage('Deploy blue & Green container') {
      steps {
        sshagent(credentials: ['capstone']) {
          sh 'scp -o StrictHostKeyChecking=no  blueController.yaml greenController.yaml blueService.yaml ubuntu@34.215.195.151:/home/ubuntu/'
          script {
            try{
              sh "ssh ubuntu@34.215.195.151 sudo kubectl apply -f ."
            }catch(error){
              sh "ssh ubuntu@34.215.195.151 sudo kubectl create -f ."
            }
          }

<<<<<<< HEAD
       		 stage('Push Docker Image') {
            		steps {
                		script {
                    			docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        		app.push("${env.BUILD_NUMBER}")
                        		app.push("latest")
                    			}
                		}
            		}
        	}
||||||| merged common ancestors
       		 stage('Push Docker Image') {
            		steps {
                		script {
                    			docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        		app.push("${env.BUILD_NUMBER}")
                        		app.push("latest")
                    			}
                		}
            		}
        	}
=======
        }
>>>>>>> 686be38dda73aaf17a9f0c0bb06e8f11ad1e2c7e

      }
    }

    stage('Wait user approve') {
      steps {
        input 'Ready to redirect traffic?'
      }
    }

    stage('Create the service in the cluster, redirect to green') {
      steps {
        sshagent(credentials: ['capstone']) {
          sh 'scp -o StrictHostKeyChecking=no  green-service.yaml ubuntu@34.215.195.151:/home/ubuntu/'
          script {
            try{
              sh "ssh ubuntu@34.215.195.151 sudo kubectl apply -f ."
            }catch(error){
              sh "ssh ubuntu@34.215.195.151 sudo kubectl create -f ."
            }
          }

        }

      }
    }

<<<<<<< HEAD
	}
}
||||||| merged common ancestors
	}
}
=======
  }
  environment {
    dockerImage = 'eugenek19/project'
  }
}
>>>>>>> 686be38dda73aaf17a9f0c0bb06e8f11ad1e2c7e
