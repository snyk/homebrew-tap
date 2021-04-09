class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.529.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.529.0/snyk-macos"
    sha256 "18a699df404139478871c9b4b01d6e4315f5600bddcce63347c39b9e6a7399ea"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.529.0/snyk-linux"
    sha256 "0ba2386b8e2accff6a2bf563079671ffc9ddfcc7ccf634a88a52657596da8907"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
