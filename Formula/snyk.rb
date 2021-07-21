class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.664.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.664.0/snyk-macos"
    sha256 "72c635d9a18a3e380ddb2a0a2fd9ab82a117d73a53f18c49330408d932fa1095"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.664.0/snyk-linux"
    sha256 "d1310ba76b1784787f0caabda85553b1018933fafbe29cd4efae073a4c5bace0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
