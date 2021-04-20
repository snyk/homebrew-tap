class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.557.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.557.0/snyk-macos"
    sha256 "349d936c8d58deca17bea41b65dda91b84cc26a446eb5e9ee79684e040a9a897"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.557.0/snyk-linux"
    sha256 "6f0f85a775a3ca6a95ebb227e619562f0b31a237570a0910f9859a446b6e494d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
