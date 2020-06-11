class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.339.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.339.0/snyk-macos"
    sha256 "4444a90caf392f7210757b14d564175e36755087271272f99eccf05e6c1a421d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.339.0/snyk-linux"
    sha256 "a5463b3e7e54df377d4936cca9d29ab1436b790e090119c23a6987e21416d3f5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
