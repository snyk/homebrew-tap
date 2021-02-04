class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.440.5"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.440.5/snyk-macos"
    sha256 "c28fcf553e1b15c6a3c3cea3ece88b2156169773bb885003f221c9cce55ff0aa"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.440.5/snyk-linux"
    sha256 "62b5daf496229b2d814dc8facc704484657c1e4f24da627735aca240dedcef68"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
