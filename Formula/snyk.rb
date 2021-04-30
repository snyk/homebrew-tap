class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.573.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.573.0/snyk-macos"
    sha256 "0ab0c1840890a88972cc428ded253f19da7c2de8e2048c7f448b522b1040f853"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.573.0/snyk-linux"
    sha256 "b0e19d38542e226ba727276a778e06a643f403fe62d586f414ff1d6a91fbf4f6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
