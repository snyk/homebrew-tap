class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.363.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.363.0/snyk-macos"
    sha256 "b61f39354994ca062f8061e822c6214e903392beb9643078e347bbdbcae3e276"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.363.0/snyk-linux"
    sha256 "c35229a5f10153243ea8a63e9fbcd8a3a30f4c2b7529153bad3d653cfa79cb51"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
