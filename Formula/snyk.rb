class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.384.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.384.0/snyk-macos"
    sha256 "40078633ef8bbc87977b9dfacf9a33707ed491b13df258698fee58dd29534fbf"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.384.0/snyk-linux"
    sha256 "60a49a21d9f498c853792c18c15cf05295787d7f63398dca2db1beee494e6250"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
