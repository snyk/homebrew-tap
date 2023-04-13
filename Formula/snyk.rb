class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1142.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1142.0/snyk-macos"
    sha256 "6c6a10b5dd6fd2b90879b216026b33581bd46e5cd1708964b1e6ec8dc03ad31c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1142.0/snyk-linux"
    sha256 "b3688d008084b1d983468e90963999b8f1b7dcb3ca3bbfa5570bc652dfd7ca29"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
