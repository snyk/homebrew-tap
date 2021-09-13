class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.707.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.707.0/snyk-macos"
    sha256 "ec4e2880e5d425ba8150bfaf6553cd7256ecd79184cc6b9d3d177fdf4062f9fa"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.707.0/snyk-linux"
    sha256 "2681273f63b398f9a9eed43d65a98ae7990c8b53abd0d9197972ec2dd4a143bd"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
