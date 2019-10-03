pipelineJob('jenkins') {
		definition {
				cpsScm {
						scriptPath 'Jenkinsfile'
						scm {
							git {
								remote {
									url('git@github.com:dyindude/jenkins-bootstrap.git')
									credentials('deploy-key-shared-library')
									}
									extensions {}
							}
						}
				}
		}
}
