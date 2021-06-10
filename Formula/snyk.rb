class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.624.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.624.0/snyk-macos"
    sha256 "c08a0e33effa98554eaa9d5e2ac26cde87790848fc6c3a388b98f72b5e4d5413"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.624.0/snyk-linux"
    sha256 "bb5697c0d9ac1405942c0cb9ebb018a05744a710b87b1be4e8ebe08e45f75c10"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
