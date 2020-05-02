pipeline {
	agent any

   	environment {
        dockerImage= "eugenek19/project"
	}

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
            		}
        	}


        	stage('Deploy blue & Green container') {
            		steps {
                          sshagent(['capstone']) {
<<<<<<< HEAD
                             sh "scp -o StrictHostKeyChecking=no  blueController.yaml greenController.yaml blueServices.yaml ubuntu@34.215.195.151:/home/ubuntu"
||||||| merged common ancestors
                             sh "scp -o StrictHostKeyChecking=no  blueController.yaml greenController.yaml blueService.yaml ubuntu@34.215.195.151:/home/ubuntu"
=======
                             sh "scp -o StrictHostKeyChecking=no  blueController.yaml greenController.yaml blueServices.yml ubuntu@34.215.195.151:/home/ubuntu"
>>>>>>> e0443e3d5f9a9adfa9884418997e79166148cab5
                             script{
                                try{
	                            sh "ssh ubuntu@34.215.195.151 sudo kubectl apply -f ./blueServices.yml"
	                     }catch(error){
	                            sh "ssh ubuntu@34.215.195.151 sudo kubectl create -f ."
                                          }
                            }
                         }
            	   }
        	}

		stage('Wait user approve') {
            steps {
                input "Ready to redirect traffic to green?"
            }
        }

                stage('Create the service in the cluster, redirect to green') {
                        steps {
                          sshagent(['capstone']) {
                             sh "scp -o StrictHostKeyChecking=no  greenService.yaml ubuntu@34.215.195.151:/home/ubuntu"
                             script{
                                try{
	                            sh "ssh ubuntu@34.215.195.151 kubectl apply -f ."
	                     }catch(error){
	                            sh "ssh ubuntu@34.215.195.151 sudo kubectl create -f ."
                                          }
                            }
                         }
                        }
                }

	}
}
