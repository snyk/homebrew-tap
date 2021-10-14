class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.737.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.737.0/snyk-macos"
    sha256 "db6c5db670a8bf7843c82e51f9a97d6e3a30d1e53edc0e83e5e103f1aa552b69"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.737.0/snyk-linux"
    sha256 "54b379920e71ad0bf5b9b85e00e48a813bbdeddcf0245efd300d05698d6168b1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
