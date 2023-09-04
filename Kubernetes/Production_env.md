Today, we'll discuss how DevOps engineers manage the lifecycle of Kubernetes clusters in production environments. This includes creation, configuration, upgrading, and deletion of clusters.
Kubernetes in Production

When practicing Kubernetes, many people use local setups like minikube, k3s, kind, k3d, or microk8s. These are excellent for learning and exploring Kubernetes, but they are development environments and not suitable for production.

In a DevOps role, you'll be expected to create and manage infrastructure, including the lifecycle of Kubernetes clusters. Therefore, it's crucial to understand the Kubernetes distributions used in production environments.
Kubernetes Distributions

Kubernetes distributions are versions of Kubernetes that have been modified or packaged differently to provide additional features or to simplify management. Examples include Amazon's EKS, Red Hat's OpenShift, VMware's Tanzu, and Rancher Labs' Rancher.

These distributions provide support and additional features, such as better user experience or customer support. However, they are built on top of the open-source Kubernetes platform, so understanding Kubernetes' core concepts and architecture will help you understand these distributions.
Kubernetes Operations (kops)

One of the most widely used tools for managing Kubernetes clusters is Kubernetes Operations (kops). It simplifies the process of managing the lifecycle of Kubernetes clusters, including creation, upgrading, and deletion.
Prerequisites

Before we start, ensure you have Python 3, AWS CLI, and kubectl installed. You'll also need to configure AWS CLI with your AWS access key ID and secret access key.
Creating a Kubernetes Cluster with kops

First, we need to create an S3 bucket where kops can store the configuration of our Kubernetes clusters.

aws s3api create-bucket --bucket my-kops-state-store --region us-west-2

Next, we'll use kops to create a Kubernetes cluster.

kops create cluster --name=myfirstcluster.k8s.local --state=s3://my-kops-state-store --zones=us-west-2a --node-count=2 --node-size=t2.micro --master-size=t2.micro --dns-zone=k8s.local

This command creates a Kubernetes cluster with the name myfirstcluster.k8s.local, stores the state in the S3 bucket my-kops-state-store, and sets up the cluster in the us-west-2a zone with 2 nodes of size t2.micro.
Updating the Kubernetes Cluster

After creating the cluster, we need to update it to apply the configuration.

kops update cluster --name myfirstcluster.k8s.local --yes

This command updates the cluster configuration and starts the Kubernetes cluster.
Conclusion

That's it! You've now created a Kubernetes cluster using kops. Remember, in a production environment, you would use a domain purchased from a certification authority and configure it in Route 53. However, for local or development environments, you can use a local domain like k8s.local.

Please note that creating and managing Kubernetes clusters on AWS will incur costs. Always remember to delete resources when you're done to avoid unnecessary charges.

'm going to basically explain you
 how DevOps engineers manage the lifecycle that is like the
 creation.
 Upgradation configuration and deletion of the kubernetes
 cluster in production.
 So why is this important because you know,
 when you try to see a lot of people on our channel commenting
 or you know people practicing kubernetes from various sources
 like udemy and Academy or any other popular YouTube channels.
 Most of the time what I have seen people are practicing things
 on minicube or you know,
 any other popular local local kubernetes setups like k3s
 K. Sorry kind k3d or micro k8s all of these things are like
 they are very good platforms for you to for you to learn
 kubernetes and explore kubernetes,
 but you need to understand
 that all of them are development environments.
 Okay.
 So what all of them are they are basically development
 environments or developer environments.
 So even if you go to kubernetes official,
 sorry minicube official documentation,
 you will see that this is just a local kubernetes cluster
 and should not be used on production, right?
 So they are just development environments.
 But if you try to get into a devops position
 or if you are being interviewed for kubernetes
 or devops administrator positions,
 one of your primary responsibilities would be
 to create infrastructure for your organization.
 And if you are using kubernetes,
 then your expectation would mean expectation from you
 from you would be to also manage the lifecycle
 of your kubernetes clusters.
 Now if you are not using minicube k3s KTA all
 of these things in your organization,
 then you should know what is the kubernetes
 that people are using in their organizations
 or what are the kubernetes distributions?
 I'll explain you what is a distribution.
 Don't worry about it.
 But how people manage kubernetes on their clusters now firstly,
 let's try to understand why are the local kubernetes cluster
 because you know, they are primarily,
 you know, they are not full-blown kubernetes clusters.
 They have they don't have usually you set up kubernetes
 in high availability or all of these things.
 These platforms do not support that.
 Okay, and they do not they do not ensure any issues
 that you run into production.
 If you just complain minicube,
 they say that oh, we are not production ready.
 When it is set up then we don't solve your problems
 in production.
 Okay.
 So saying all these things let's try to understand
 how organizations devops engineers cloud engineers manage
 their kubernetes clusters in production systems.
 Okay.
 So before that you need to understand
 that what is a kubernetes distribution
 and what are the popular kubernetes distributions
 because this is where your interview is going to be.
 So people will not ask you questions on minicube people
 will not ask you questions on key 3s.
 Whereas people will ask you
 what kubernetes distribution have you used in your production
 and if you have used any kubernetes distribution,
 did you manage that installation?
 Did you manage the upgrades of that specific distribution?
 So this is where your interview is going to be.
 Now, what is a distribution so for any open source platforms
 like let's take example of Linux.
 Okay.
 So first of all Linux is a open source free software.
 So what people have done is they have developed distributions
 on top of it.
 For example best example is Amazon Linux, right?
 So you must if you are using AWS,
 you must have seen something called as Amazon Linux distribution
 or you must have seen something called as red hat distribution
 sent as Ubuntu.
 So what are all of these things?
 They are basically distributions
 like these people have taken the open source Linux platform
 and they said that okay,
 let's enhance this creative rappers on top of it
 or you know create our own distribution on it.
 Whereas like if you can talk about Amazon Linux or red hat
 if you have any issues with your Linux platform,
 let's say your kernel is not working well
 or any of these things
 so you can directly talk to red hat or Amazon Linux
 and they will also on time
 if you are using Amazon Linux one of the advantages
 they will ensure that whenever there is security patches
 or any of these things they upgrade on time to time basis.
 It's not that open source platforms don't do it
 but because you are paying for let's say you're using red hat
 subscription because you are paying for red hat subscription.
 So they ensure that your operating system
 or your kernel is safe from all
 of the security vulnerabilities, right?
 So this is one of the advantages
 of providing the distributed version similarly,
 even if you take example of in the same lines kubernetes.
 Okay, so kubernetes is a open source container orchestration
 solution platform, right?
 It's a open source.
 Coy platform container orchestration.
 In general container orchestration solution.
 So what people have done is they have identified that okay.
 So let's build software on top of kubernetes
 or let's build distributions on top of kubernetes.
 For example, what Amazon has done is they have come up
 with its own managed Kubernetes service.
 That is EKS or what red hat has done is they came up
 with their open, you know distribution called open shift
 VMware has Tanzu.
 There is something called as Rancher Labs,
 which has created something called as Rancher.
 So all of these are distributions of kubernetes.
 Okay, so it's like if you understand the concept
 if you understand the architecture
 if you understand how kubernetes works,
 then you almost know all of these tools
 because they are not building anything new
 but they are building only user experience
 on top of kubernetes
 or they are providing a better customer experience.
 Okay.
 What is customer experience?
 Let's say you have any issue with EKS.
 So, you know that you can raise a support ticket with Amazon
 and it will get resolved as soon as possible
 because you are paying for EKS.
 Okay, whereas if you create easy to instances,
 okay and on top of easy to instances
 if you are installing kubernetes on your own,
 then if you tell Amazon that oh, okay.
 I went into some issue on kubernetes then Amazon will tell
 you let us know if you ran into some issues on easy to
 because that is the software that we are providing you
 or that is the is tool or compute
 that we are providing you kubernetes is something
 that you have installed by your own.
 If you want support from us on kubernetes
 get into our manage kubernetes service that is EKS.
 Yeah, that is EKS.
 So there are various distributions of kubernetes
 and why the distributions are popular
 because these distributions provides you support tomorrow.
 If you land into some issue with kubernetes
 the open source platform they will definitely help you
 but they have their own timelines, right?
 So they cannot say that okay customer XYZ is running
 into some issues on kubernetes.
 So let me fix their issue.
 They'll have their own priority.
 If you talk about the licensed ones
 because you are paying them money,
 so they'll give you instant support.
 Okay, but what is the order of this distributions
 like which distribution is very popular
 and which distributions are widely used.
 This is very important again is
 because if you are giving an interview you cannot say
 that you are using my mini cube on your production system.
 Then your interviewer will immediately reject you.
 So you should tell them that okay.
 I am using one of these systems
 and what are these one of the systems?
 Firstly kubernetes itself.
 So now you might ask me
 Abhishek you just told me
 that kubernetes is a open source software.
 You don't have support to it.
 So I did not tell you
 that you don't have support to it,
 but you know, it's not a managed
 or it's not a distributed
 or you know, it's not a platform
 that is provided by any enterprise like Amazon
 or red hat or anybody who gives you instant support,
 but the thing is
 that let's say you are working in an organization
 that has some hundreds of kubernetes clusters
 on their production.
 Okay now or they have one single kubernetes cluster,
 but with hundreds of nodes or thousands of nodes.
 Okay now.
 To run these applications to test this application.
 There can be hundred developers.
 Okay, or there can be hundred teams with 10,000 developers.
 Now if you ask each
 and every developer to create a EKS cluster,
 then all of your organization revenue will just go
 to the case.
 Okay, so your organization will go spend a lot
 of money on just EKS.
 So what people do is that in their staging
 or in their pre-production stages,
 they just use the.
 Kubernetes systems for local testing
 or for testing the applications for developers
 who wants to initially test their software.
 They use k8 or platforms like this instead of EKS
 and one more thing is
 there can be also enterprises,
 you know, which can use kubernetes itself on the production
 because again, there is a reason for it.
 Why enterprises can directly use kubernetes
 on their production is
 because not every organization,
 you know, they have time lens like,
 you know, if there is any issue it has to be fixed in one hour.
 So not every organization runs into such kind of issues.
 So there are hundreds or thousands
 or you know, 10,000 of organizations
 which still use kubernetes on production not just
 these things.
 So okay, so kubernetes is the topmost one
 that is used in production after that people use.
 Open shift.
 And after that,
 so I have done some research on these things read some articles
 and this is the order.
 So after that people use rancher.
 Then there is something called as VMware Tanzu.
 Then comes your EKS aks GKE Docker kubernetes engine.
 So all of these things falls after that.
 No, I'm not comparing Docker Swam with this
 because they are all kubernetes distributions.
 Okay, Docker Swam is a different container orchestration
 engine itself.
 Okay, but these things are kubernetes distributions.
 There is a difference between both of these things, right?
 Okay.
 So now as a devops engineer,
 you should always project yourself to a interviewer
 that you are not using minikube or microk8s
 or kind of these things on your production system,
 but you are using one of these things
 on your production system.
 So what is the difference
 between installing kubernetes directly versus installing
 minikube so if you are using or installing kubernetes,
 that means to say
 that you are installing kubernetes with all the capabilities
 for a enterprise.
 Okay, for example, just give an example minikube can run
 on a single node architecture with just like,
 you know to CPUs and 4GB RAM.
 Whereas if you are actually dealing
 with your kubernetes cluster in production,
 you will need a lot of capabilities
 like your etcd itself will take a lot of you know storage
 and memory and then you have your EBS volumes
 if you are installing on AWS,
 of course or else if you have your storage related things
 and you have all of your components
 that are you know in full-blown capacity.
 So that is the difference between minikube and kubernetes
 and one more question before I show you the demo in life
 because I know you are all very excited about the demo.
 I'm going to show you how we are going to install not
 like minikube or something,
 but we will use a tool called cops kubernetes operations
 and I'll show you how in real a cloud engineer
 or DevOps engineer installs
 and manages their hundreds of kubernetes clusters.
 Okay, but one more question is what is the difference
 between kubernetes?
 And EKS.
 Okay.
 So the difference between kubernetes
 and EKS is if you are installing a couple of easy to instances
 and if you install kubernetes on top of it
 and make a cluster that means to say
 that you are managing this kubernetes cluster
 and Amazon will not provide you any support on issues
 with the kubernetes whether it can be misconfiguration
 or whether it can be any kind of issue on kubernetes.
 Whereas if you are using EKS,
 then you get support from Amazon.
 That's the only difference rest of the things on EKS there
 because this is a managed and supported solution by Amazon.
 They just have some wrappers.
 They have some additional scripts.
 They have something called as EKS CTL.
 So you can consider this as again like a distribution
 of kubernetes that is provided by Amazon
 which has some additional wrappers
 which has some additional plugins
 and command line options,
 but end of the day the solution is the same.
 Okay.
 Now, let's move on to the topic for today.
 That is how DevOps engineer manage their hundreds
 of clusters on production.
 So one of the primary tool
 or one of the most widely used tools is cops.
 That doesn't means that there are no other tools.
 So you have tools like QB medium you have cube squash.
 There are multiple tools
 but cops is the one that is most widely used.
 So let's talk about cap cops.
 So initially if you talk about four years five years back
 or six years back QB medium was the one
 that was most widely used
 and even I started learning kubernetes
 or creating the clusters using QB medium.
 The only difference is with QB medium.
 You have to do a lot of manual activities
 and you know, whenever you are talking about the upgrades
 or you know configuring modifying your kubernetes clusters
 QB medium does not have that smooth way of handling things
 whereas cops is basically kubernetes operations.
 Okay.
 So that's why it's called cops kubernetes operations, right?
 So what cops brings you is for a DevOps engineer.
 One of the most important thing is not just the installation
 but you have to deal with upgrades right?
 Then you have to deal with modifications.
 You have to deal with deletion of clusters.
 So all of these things
 which is called as a life cycle of kubernetes.
 Okay, so you have a life cycle of kubernetes
 that is managed by cops.
 So that is why cops is one of the most widely used tools
 for installing kubernetes.
 Whereas if we go for the other options,
 let's say if you go back to the previous slides,
 so you have open shift you have rancher you have Tansu.
 So all of these things have their own set of installations
 and like say, let's say you have to install open shift.
 So what you will do is let's say you want to project yourself
 as a DevOps engineer who knows open shift
 and who works on open shift.
 So what you can do is you can go to the open shift talks
 and you will see
 that open shift provides you a lot of ansible playbooks using
 this ansible playbooks you can install open shift platform,
 but saying that you need to have red hat subscription.
 You cannot you know directly use CentOS machines
 and install open shift over on top of it,
 but you have to create a red hat virtual machines
 on your Amazon Linux and on top of that you can download
 the ansible playbooks that are present
 on the open shift documentation
 and you can install ansible on top of these things.
 Okay, but be careful all of these things
 whenever you are purchasing the red hat subscription
 or whenever you are going for the installation of.
 EKS or EKS or GKE.
 So that will incur some money
 because you know those things will not be covered
 by Amazon on your free tier.
 So if you have Amazon credits,
 or if you know you can you will you are willing to pay
 for the these things then you can go ahead and try
 but even if you learn the thing
 that I'm going to talk about today
 that is using cops how DevOps engineers manage
 their production systems that is more than enough.
 Okay, so you can say that we are using cops
 and we are managing kubernetes systems on our environment.
 And you know your interviewer will be very interested.
 Okay.
 So as I told you all of these things now
 without wasting any time,
 let me go on to the other screen and let me explain you
 how to install and do all of these things.
 Okay.
 So let me stop sharing here
 and then let me start sharing my other screen.
 Okay.
 One two three.
 Perfect.
 Okay.
 So one disclaimer before you start trying these things.
 Even using cops the thing is
 that you have to create a couple of easy to instances.
 Then you have to create a bunch of EBS volumes S3 buckets.
 And if you have your custom domain you have to also deal
 with Route 53.
 So be careful when you are even following this specific demo
 because even with this
 because we are creating EBS volumes of size 8 GB
 and we are creating Route 53 and all of these things.
 It will be chargeable.
 So if you don't want to spend money just understand
 the process that would be even more than enough
 or else I'm going to show you a trick using
 which you can create the kubernetes cluster
 without actually, you know paying money
 or you know without actually.
 Going into the AWS billing.
 Okay.
 So the first thing
 that you would do is configure the AWS CLI itself, right?
 So if you want to create this kubernetes clusters,
 you can follow this specific GitHub repository called
 kubernetes zero to hero
 where I have written the steps each and everything
 like, you know, you can simply follow these steps
 and understand the process
 or you can try out by yourself as well.
 So start this repository in future.
 I'm going to add more
 and more contents regarding kubernetes into it.
 So firstly there are three prerequisites
 for this specific installation.
 You need to install python 3
 because AWS CLI requires python 3 and you also need kubernetes
 because you are going to play with your kubernetes cluster
 if you just want to install and leave it then you don't need
 to kubernetes.
 Okay, if you just want to learn the installation so python 3
 and AWS CLI are the dependencies.
 So either you can carry out this specific demo
 on your personal laptop
 or you can also do it on your AWS.
 Okay.
 So if you want to do it on your AWS,
 you can create a easy to instance in all our previous videos.
 We were using Ubuntu.
 So create a Ubuntu instance and then you know,
 you can basically run this command
 so that your AWS CLI python and kubernetes is configured.
 Okay.
 So these are the steps that are required for the dependencies.
 So I'm not going into the dependencies
 because I have explained all of these things
 in the previous classes as well how to install python 3
 AWS CLI and kubectl.
 If you haven't followed the steps are also available
 in this specific github document just get the repositories
 that are required and then perform an apt update.
 Then, you know install python kubectl
 and then you know set them to the path.
 That's it.
 Now we will proceed to the installations for day
 that is cops.
 So cops like I told you is the hero for today
 because we are dealing kubernetes operations using cops.
 So if you again on Ubuntu just execute these specific commands,
 so I have already done if you see in my case
 if I just run cops you'll see
 that cops is installed on my machine.
 Okay, so just follow the steps.
 That's it.
 I'm not doing anything more than that after this comes
 the interesting parts.
 That is you need to grant your AWS CLI.
 I am user with this specific permissions.
 So if you are using the AWS admin user itself,
 like in my case what I'm done is,
 you know because I'm going to perform demo and I know
 that I don't use AWS.
 I am users in the production.
 So what I did is I just use the AWS admin user.
 Okay.
 So in the previous classes,
 I told you how to you know,
 basically login into AWS using your CLI the command
 that you need to do is AWS configure.
 If you do AWS configure you will be asked
 with your AWS access key ID.
 Once you provide that you have to provide your AWS
 secret access key then provide your default region output
 format and done.
 So where did you get this access key and secret access key
 like access key ID and secret access key just go
 to your AWS dashboard to your top, right?
 You have one section called security credentials.
 Just go to this and once you go here,
 you will see that there is an option for your.
 Access keys.
 Okay.
 So if you see here,
 are my access keys and you can create your own access keys
 as well.
 Perfect.
 So I have done that because I am using admin user.
 I don't have to grant the permissions.
 But if you are not using the admin user
 and if you are using the I am user you have
 to provide these roles.
 Okay, that is easy to full access S3 full access.
 I am full access and VPC full access.
 If you are already like I told you
 if you are already using admin user that comes by default
 with all of these permissions.
 Okay, just run AWS configure.
 Then what cops requires as a prerequisite is you need
 to create a S3 bucket.
 Now, why do you need to create S3 bucket?
 The reason for that is cops basically is used to manage
 your hundreds of Kubernetes clusters and to manage
 these hundreds of Kubernetes clusters.
 It is very easy
 if cops can store all of the configurations
 of your Kubernetes clusters in S3 bucket.
 Okay, so it just needs a storage service.
 So S3 is offered as one of the storage services.
 So you need to just create just copy this command.
 Okay, click on the copy button come here
 and just create the bucket.
 Okay, so I'll just create the bucket as cops abe storage one.
 Okay, so make sure that you change this specific thing
 if you are using the same thing then your S3 command
 will fail saying that the.
 Specific thing is already present that is the specific AWS
 bucket is already present after this you go
 to the cops command that is to create your Kubernetes cluster.
 So if we debug this command firstly cops,
 we are doing create cluster name of the cluster S3 storage
 that we have just created
 and then we provide what zone it has to be created
 which region it has to be created then how many node count
 like do you want a Kubernetes cluster with one node
 to node 100 node so you can provide whatever you would
 like to and then provide the size of the node
 that is T2 micro or macro
 or whatever you would like to use finally
 provide the EBS volume size.
 Okay.
 So this is the simple command.
 You can just copy paste the command as is
 and then what you will do is just modify the S3 bucket name
 in the specific command.
 I just said hyphen 1 and also modify the name
 of the cluster according to your wish.
 One thing to remember here is I am using cluster
 with name k8 local.
 So the domain that I am using is a local domain
 but in production systems or in your organizations,
 you will not use this local domain instead.
 You will use something like Amazon.com Google.com
 or if your company is called XYZ then XYZ.com
 and one additional step would be you have to configure
 these domain in your route 53.
 That's the only additional step rest all the steps are the same.
 So once you do this your Kubernetes cluster is created.
 So one tip that I'm going to give you here is stop
 the actions here itself
 because after this you have one specific command.
 So here itself your Kubernetes cluster will be created.
 You will see that your Kubernetes cluster is created.
 You can just execute this command and see
 but all of your configuration is not updated.
 That means so here you are creating the cluster
 but you are not, you know starting your Kubernetes cluster.
 So if you have free AWS credits or if you have your AWS account
 with some special points or you are you are willing to pay
 then just execute these commands right now.
 I'm not executing this command
 because if I execute this command already have bunch
 of things on my AWS account,
 which I'm already spending money on so I don't want
 to create one more Kubernetes cluster.
 So see here it says
 that the cluster configuration has been created just finally
 configure your cluster using this one specific command
 and your Kubernetes cluster configuration will be done.
 Just wait for a couple of minutes after this
 because cops will take some time
 for starting your Kubernetes cluster.
 So this is the video for today
 and if you have to explain your interviewer the only thing
 that you will modify is instead of your local domain tell them
 that we have a domain that we have purchased from good ad
 or you know our organization has procured this domain
 from some certification authorities
 and these domain we configure in route 53.
 So if you want to learn how to configure this domain
 in route 53 again, that's not a big process.
 All that you need to do is there is one simple command
 that I will try to put in the document as well.
 But this is the command I'm going to paste the command here.
 Just a moment.
 I copied it to the notepad.
 Yeah, so this is a simple command
 that you are going to execute.
 Okay.
 So what this command does is it would configure like,
 you know instead of dev dot example.com just replace it
 with your domain.
 Okay.
 So if your domain is Amazon.com for example,
 so just replace it with Amazon.com
 and it will create you a hosted zone in route 53.
 So once you have this hosted zone created on route 53,
 then your kubernetes cluster configuration is done.
 But if you don't want to spend on a custom domain,
 let's say you are just using this things on your local not
 on my on your personal laptop,
 but even on your organizations,
 let's say you are trying these things out on your dev
 environment or staging environment.
 You can simply use dot k8 dot local,
 which is a local domain.
 Okay, so you can also explain this to your interviewer
 that for my local systems.
 I'm using dot k8 dot local
 but for the production we are using the dot example.com
 or whatever the domain it is.
 So this is a video for today.
 I hope you like the video but from tomorrow don't try
 your actions or you know,
 don't try your experiments on this cops created kubernetes
 clusters like I told you they'll incur some amount
 or you know, you have to you will be built by AWS.
 So installations you can do it using minikube
 for your local kubernetes learnings and all of the things.
 I'll put the comment in the description
 where I have showed you how to install minikube in five minutes,
 right?
 So watch that video and tomorrow from tomorrow's video.
 Whatever.
 I'm going to explain you try that things out on minikube itself.
