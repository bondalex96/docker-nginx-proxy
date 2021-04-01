include .env
export

deploy-remote: ## Deploy Remote
	ssh -o StrictHostKeyChecking=no ${REMOTE_SSH_HOST} 'mkdir -p ${REMOTE_PROJECT_ROOT}'
	ssh -o StrictHostKeyChecking=no ${REMOTE_SSH_HOST} 'cd ${REMOTE_PROJECT_ROOT} && rm -rf docker-compose.yml'
	scp -o StrictHostKeyChecking=no docker-compose.yml ${REMOTE_SSH_HOST}:/${REMOTE_PROJECT_ROOT}/docker-compose.yml
	ssh -o StrictHostKeyChecking=no ${REMOTE_SSH_HOST} 'cd ${REMOTE_PROJECT_ROOT} && docker-compose pull'
	ssh -o StrictHostKeyChecking=no ${REMOTE_SSH_HOST} 'docker network create nginx-proxy || true'
	ssh -o StrictHostKeyChecking=no ${REMOTE_SSH_HOST} 'cd ${REMOTE_PROJECT_ROOT} && docker-compose up --build -d --remove-orphans'
