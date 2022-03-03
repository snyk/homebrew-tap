class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.860.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.860.0/snyk-macos"
    sha256 "3349db7e50b41f0a52c1e12afadb8f99366971a700c809f2b69413449320b990"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.860.0/snyk-linux"
    sha256 "73e2fc465983a7d3cc4276246e81623f3529258d6fb642053b89923bf145a99b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
