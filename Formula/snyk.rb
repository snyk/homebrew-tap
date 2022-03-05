class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.863.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.863.0/snyk-macos"
    sha256 "a71c692d710dd4c9032b5046884ea14e788af429b73ae98d1eeabe3d28354239"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.863.0/snyk-linux"
    sha256 "43e4246ac5a8fac1911b6a3431ffacda6a624445a2a8fbb6d19d3720dfdf3ff2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
