class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.298.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.298.0/snyk-macos"
    sha256 "ab5474949a61a558d49c09c197c8a5fd32bae451853847891f17bd7652e48dc9"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.298.0/snyk-linux"
    sha256 "94eed69b3e520546543305fde89e0b1f49a0c6f53d3d3f07df2a67882546452c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
