class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.570.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.570.0/snyk-macos"
    sha256 "e76a6437e36fb91a03e593898614e9883f1437969019171a4cd75ed1de858e26"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.570.0/snyk-linux"
    sha256 "cfbad9c76ec9468d1a05549166db5a196d264745668bdc94f5c459a56d9b83ba"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
