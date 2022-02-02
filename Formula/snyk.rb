class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.844.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.844.0/snyk-macos"
    sha256 "be7d0c48da5342e242e1c9f0245ab48a32a3a42a74f5a8c3ab7e7e2d941a9f2a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.844.0/snyk-linux"
    sha256 "96b409264bf7fa6bea2ce7a0088fa4c87db3d0322ec91b54af95f0b2b9c0889d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
