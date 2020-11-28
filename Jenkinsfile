pipeline {
  agent any
  stages {
    stage('Lint Dockerfile') {
      steps {
        sh 'hadolint Dockerfile'
      }
    }

    stage('Build docker image') {
      steps {
        sh 'docker build --tag=udapeople .'
      }
    }

    stage('Push docker image') {
      steps {
         withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
            sh "docker tag udapeople robinhalfbloodprince/udapeople"
            sh "docker push robinhalfbloodprince/udapeople"
         }
      }
    }
    stage('Deploy the container'){
      steps {
         withAWS(region:'ap-south-1',credentials:'666409628308') {
            sh "aws eks --region ap-south-1 update-kubeconfig --name capstoneclustersagarnil"
			sh "kubectl config use-context arn:aws:eks:ap-south-1:666409628308:cluster/capstoneclustersagarnil"
            sh "kubectl apply -f deployment.yml"
            sh "kubectl get nodes"
            sh "kubectl get deployments"
            sh "kubectl get pod -o wide"
            sh "kubectl get services/udapeople"			                
         }
      }
    }
	
	stage('Checking if app is up') {
              steps{
                  echo 'Checking if app is up...'
                  withAWS(credentials: '666409628308', region: 'ap-south-1') {
                     sh "curl a129d064b186f41e9bec2737840ca7ee-1719123095.ap-south-1.elb.amazonaws.com:5000"
                     
                  }
               }
    }
    stage('Checking rollout') {
      steps{
         echo 'Checking rollout...'
         withAWS(credentials: '666409628308', region: 'ap-south-1') {
            sh "kubectl rollout status deployments/udanew"
            }
        }
    }
    stage("Cleaning up") {
      steps{
         echo 'Cleaning up...'
         sh "docker system prune"
         }     

    }
  }
}
