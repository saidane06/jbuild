def pipelineContext = [:]
node {

   def registryProjet='registry.gitlab.com/saidane06/presentations-jenkins'
	 def IMAGE="${registryProjet}:version-${env.BUILD_ID}"

	 echo "IMAGE = $IMAGE"

    stage('Clone') {
    			checkout scm
		}

		def img = stage('Build') {
					docker.build("$IMAGE",  '.')
		}
	
		stage('Run') {
					img.withRun("--name run-$BUILD_ID -p 81:81") { c ->
						sh 'curl localhost'
          }					
		}

		stage('Push') {
					docker.withRegistry('https://registry.gitlab.com', 'gitlab') {
							img.push 'latest'
              img.push()
					}
		}
 
}

