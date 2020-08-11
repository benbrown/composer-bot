steps for setting this up:
add the contents of the Deploy folder to the top level of your repo
create a copy of example.yml, replacing variables with your own
 - projectPath: path to your bot's declarative assets
 - resourceGroupServiceConnection: name of the service connection registered in your ADO organization - this is how the pipeline will authenticate to Azure, your app service and key vault must reside in the resource group to which the service connection is registered
 - keyVaultName: name of your key vault containing luis keys
 - luisAuthoringKeySecretName: name of the key vault secret whose value is your luis app's authoring key
 - luisEndpointKeySecretName: name of the key vault secret whose value is your luis app's endpoint key
 - appServiceResourceName: name of the app service to which you are deploying
create a build definition in azure devops, linking to your new yaml file
create the service connection to your bot's resource group, if you have not yet
if you do not yet have luis settings in your settings/appsettings.json file for your bot, add them now - make sure name (this can be anything, as the pipeline will publish your app under this name on running), authoringRegion, and endpoint are specified
run your pipeline
when complete, your pipeline will have created a new luis app - make sure that your endpoint resource in azure is linked to the new app that your pipeline has created in the luis portal
go to your bot and test in webchat - if you have configured things such that the endpoint key you have retrieved from key vault is associated with the luis resource linked to the luis app the pipeline published, then everything should work