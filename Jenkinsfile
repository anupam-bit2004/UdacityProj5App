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
        sh 'docker build --tag=udanew .'
      }
    }

    stage('Push docker image') {
      steps {
         withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
            sh "docker tag udanew robinhalfbloodprince/udanew"
            sh "docker push robinhalfbloodprince/udanew"
         }
      }
    }
    stage('Deploy the container'){
      steps {
         withAWS(region:'us-east-1',credentials:'aws') {
            sh "aws eks --region ap-south-1 update-kubeconfig --name udajen"  
            sh "kubectl apply -f deployment.yml"
            sh "kubectl get nodes"
            sh "kubectl get deployment"
            sh "kubectl get pod -o wide"
            sh "kubectl get service/udanew"			                
         }
      }
    }    

  }
}
