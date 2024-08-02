class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1292.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.2/snyk-macos"
    sha256 "efd066d52799fa964d6912d2cd94629c2ed2b014617107a1497efff2e09ef567"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.2/snyk-macos-arm64"
    sha256 "54fcb68f6c13de740aef597bfae3f8d5faeac5db24c6c2f0040f7946292a6517"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.2/snyk-linux"
    sha256 "4d4a81040a665428f3036f958a949621991a5501195d1345f17c260795009f1a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.2/snyk-linux-arm64"
    sha256 "5ddc071b56d31769c98fa06234b80e13e17a4505056f867c96b5abe8aeb3e865"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
