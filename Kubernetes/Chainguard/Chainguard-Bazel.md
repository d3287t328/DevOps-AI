The image cgr.dev/chainguard/bazel is a pre-packaged Docker image for Bazel, a fast and scalable build system. This image is hosted on your internal Chainguard registry.

Key Information
Last Changed: September 3rd
Digest: sha256:7dff67c79922ed9bb3dc3554c04d9737ea60e3a7363e823045de13e3c4582713
Description: Bazel is designed for multi-language and extensible builds. It's widely used for large codebases.

To pull the image, use the following command:
docker pull cgr.dev/chainguard/bazel

You can test the image using Bazel's official examples. Here's how:

Clone the Bazel examples repository:
git clone git@github.com:bazelbuild/examples.git

Navigate to the Java tutorial directory:
cd examples/java-tutorial

Run the Chainguard Bazel image:
docker run --rm -ti --entrypoint bash -v ${PWD}:/home/bazel cgr.dev/chainguard/bazel

Build the example:
bazel build //:ProjectRunner

Run the example:
bazel-bin/ProjectRunner

See the output message:
Hi

The provided steps cover cloning an example Bazel project, using the Chainguard Bazel image to run a container, and then building and running the example project within that container. This setup allows you to easily spin up an environment for building projects with Bazel without having to install Bazel and its dependencies on your local machine.