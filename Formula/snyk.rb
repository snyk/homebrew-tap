class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.471.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.471.0/snyk-macos"
    sha256 "d6c1ec13dcb96400fc7f2de9ecb41a61a540239d5c1fd5b62b024153ca24cfa9"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.471.0/snyk-linux"
    sha256 "c394ee773cbe90f4aa68efad69c6859288a543300c7ece5da3ac6c0d56d09582"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
